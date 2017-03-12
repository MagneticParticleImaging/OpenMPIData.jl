using HDF5

export reconstruction, kaczmarzReg, filterFrequencies


function reconstruction(filenameCalib, filenameMeas; 
                        iterations=1, lambda=0.1, SNRThresh=1.8, 
                        minFreq=30e3, maxFreq=1.25e6, recChannels=1:3)

  nFreq = length(h5read(filenameCalib, "/acquisition/receiver/frequencies"))
 
  # filter frequencies and load the indices of matrix rows that
  # should be used for reconstruction
  freq = filterFrequencies(filenameCalib, SNRThresh=SNRThresh, minFreq=minFreq,
                           maxFreq=maxFreq, recChannels=recChannels) 

  # get type of system matrix and sizes
  firstRow = h5read(filenameCalib, "/calibration/dataFD", (:, :, 1, 1) )
  S = zeros(Complex{eltype(firstRow)}, size(firstRow,2), length(freq))

  for (idx,fr) in enumerate(freq)
    i, j = ind2sub((nFreq,3), fr)
    row = h5read(filenameCalib, "/calibration/dataFD", (:, :, i, j))
    S[:,idx] = reinterpret(Complex{eltype(firstRow)}, row, (size(row,2),))
  end

  # read the (full) measurement data and drop the frequencies
  u = h5read(filenameMeas, "/measurement/dataFD")
  u = reinterpret(Complex{eltype(u)}, u, (size(u,2)*size(u,3), size(u,4)))
  u = u[freq,:]

  # average over all temporal frames
  u = vec(mean(u,2))

  lambda_ = calculateTraceOfNormalMatrix(S)*lambda/size(S,1)
  
  # reconstruct using kaczmarz algorithm
  c = kaczmarzReg(S,u,iterations, lambda_, false, true, true)

  return c
end


function filterFrequencies(filenameCalib; SNRThresh=-1, minFreq=0, maxFreq=1.25e6, recChannels=1:3)

  freq = h5read(filenameCalib, "/acquisition/receiver/frequencies")
  nFreq = length(freq)
  nReceivers = h5read(filenameCalib, "/acquisition/receiver/numChannels")
  bandwidth = h5read(filenameCalib, "/acquisition/receiver/bandwidth")

  minIdx = round(Int, minFreq / bandwidth * nFreq )
  maxIdx = round(Int, maxFreq / bandwidth * nFreq )

  freqMask = zeros(Bool, nFreq, nReceivers)

  freqMask[:,recChannels] = true

  if minIdx > 0
    freqMask[1:(minIdx-1),:] = false
  end
  if maxIdx < nFreq
    freqMask[(maxIdx+1):end,:] = false
  end
  

  SNR_ = h5read(filenameCalib, "/calibration/snrFD")
  SNR = reshape(SNR_, div(length(SNR_),3),3)

  if SNRThresh > 0
    freqMask[ find(vec(SNR) .< SNRThresh) ] =  false
  end

  freq = find( vec(freqMask) )

  return freq
end

function calculateTraceOfNormalMatrix(S)
  energy = zeros(Float64, size(S,2))
  for m=1:size(S,2)
    energy[m] = norm(S[:,m])
  end
  return  norm(energy)^2
end
 


@doc """
The regularized kaczmarz algorithm solves the Thikonov regularized least squares Problem 
argminₓ(‖Ax-b‖² + λ‖b‖²).
# Arguments
* `A::AbstractMatrix`: System matrix A
* `b::Vector`: Measurement vector b
* `iterations::Int`: Number of iterations of the iterative solver
* `lambd::Float64`: The regularization parameter, relative to the matrix trace
* `shuff::Bool`: Enables random shuffeling of rows during iterations in the kaczmarz algorithm
* `enforceReal::Bool`: Enable projection of solution on real plane during iteration
* `enforcePositive::Bool`: Enable projection of solution onto positive halfplane during iteration
""" ->
function kaczmarzReg{T}(A::AbstractMatrix{T}, b::Vector{T}, iterations, lambd, shuff, enforceReal, enforcePositive )
  M = size(A,2)
  N = size(A,1)

  x = zeros(T, N)
  residual = zeros(T, M)

  energy = zeros(Float64, M)
  for m=1:M
    energy[m] = norm(A[:,m])
  end
    
  rowIndexCycle = collect(1:M)

  if shuff
    shuffle(rowIndexCycle)
  end

  lambdIter = lambd
  
  for l=1:iterations
    for m=1:M
      k = rowIndexCycle[m]
      if energy[k] > 0
        tmp = dot_with_matrix_row(A,x,k)
      
        beta = (b[k] - tmp - sqrt(lambdIter)*residual[k]) / (energy[k]^2 + lambd) 
        
        for n=1:size(A,1)
          x[n] += beta*conj(A[n,k])
        end

        residual[k] = residual[k] + beta*sqrt(lambdIter)
      end
    end

    if enforceReal && eltype(x) <: Complex
      x = complex(real(x),0)
    end
    if enforcePositive
      x[real(x) .< 0] = 0
    end
  end

  return x
end

@doc """
Calculates the dot product between x and the k-th matrix row of A.
# Arguments
* `A::AbstractMatrix`: System matrix A
* `x::Vector`: Measurement vector b
* `k::Int: matrix row
"""->
function dot_with_matrix_row(A, x, k)
  tmp = 0.0
  for n=1:size(A,1)
    tmp += A[n,k]*x[n]
  end
  tmp
end


