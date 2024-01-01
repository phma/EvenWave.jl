module EvenWave
export φz,rotx,tumble,norm,rotate

using Quaternions

φturn=(√5-1)*π/2

φz=quat(cos(φturn/2),0,0,sin(φturn/2))

function rotx(θ::AbstractFloat)
  quat(cos(θ),sin(θ),0,0)
end

function tumble(θ::AbstractFloat)
  if abs(θ)<eps(typeof(θ))/16
    rotx(θ)
  else
    rotx(θ)*(φz*tumble(θ/ℯ)*conj(φz))
  end
end

function norm(q::Quaternion)
  √real(q*conj(q))
end

function rotate(q::Quaternion,v::Vector{<:AbstractFloat})
  @assert(length(v)==3)
  qv=Quaternion(0,v[1],v[2],v[3])
  imag_part(q*qv*conj(q))
end

end # module EvenWave
