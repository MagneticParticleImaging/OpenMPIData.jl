using HDF5

export reconstruction, kaczmarzReg


function reconstruction(filenameCalib, filenameMeas, iterations, lambda)

  # read the full system matrix
  S = h5read(filenameCalib, "/calibration/dataFD")
  # reinterpret to complex data
  S = reinterpret(Complex{eltype(S)}, S, (size(S,2),size(S,3),size(S,4)))

  # read the measurement data
  u = h5read(filenameMeas, "/measurement/dataFD")
  u = reinterpret(Complex{eltype(u)}, u, (size(u,2), size(u,3), size(u,4)))

  # we now load the frequencies
  freq = h5read(filenameMeas, "/acquisition/receiver/frequencies")

  # remove frequencies below 30 kHz
  idxMin = findfirst( freq .> 30e3)
  S = S[:,idxMin:end,:]
  u = u[idxMin:end,:,:]

  # merge frequency and receive channel dimensions
  S = reshape(S, size(S,1), size(S,2)*size(S,3))
  u = reshape(u, size(u,1)*size(u,2), size(u,3))

  # average over all temporal frames
  u = vec(mean(u,2))

  # reconstruct using kaczmarz algorithm
  c = kaczmarzReg(S,u,1,1e6,false,true,true)

  return c
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


