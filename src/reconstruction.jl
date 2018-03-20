export reconstruction, kaczmarzReg


function reconstruction(filenameCalib, filenameMeas; 
                        iterations=1, lambda=0.1, SNRThresh=1.8, 
                        minFreq=30e3, maxFreq=1.25e6, recChannels=1:3,
                        frames=1:acqNumFGFrames(MPIFile(filenameMeas)),
                        periods=1:acqNumPeriodsPerFrame(MPIFile(filenameMeas)),
                        bgCorrection=true)

  fCalib = MPIFile(filenameCalib)
  fMeas = MPIFile(filenameMeas)


  # filter frequencies and load the indices of matrix rows that
  # should be used for reconstruction
  freq = filterFrequencies(fCalib, SNRThresh=SNRThresh, minFreq=minFreq,
                           maxFreq=maxFreq, recChannels=recChannels) 
  
  S = getSystemMatrix(fCalib, freq, bgCorrection=bgCorrection)

  u = getMeasurementsFD(fMeas, frequencies=freq,periods=periods,frames=frames,bgCorrection=bgCorrection)
  # average over all temporal frames
  u = vec(mean(mean(u,2),3))

  lambda_ = calculateTraceOfNormalMatrix(S)*lambda/size(S,1)
  
  # reconstruct using kaczmarz algorithm
  c = kaczmarzReg(S,u,iterations, lambda_, false, true, true)

  return reshape(c, calibSize(fCalib)..., :)
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
      x = complex.(real.(x),0)
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


