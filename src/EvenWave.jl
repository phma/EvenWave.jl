module EvenWave
using GLMakie
export φz,rotx,tumble,norm,rotate,evenWave,graph

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

function norm(q::Quaternions.Quaternion)
  √real(q*conj(q))
end

function rotate(q::Quaternions.Quaternion,v::Vector{<:AbstractFloat})
  @assert(length(v)==3)
  qv=Quaternions.Quaternion(0,v[1],v[2],v[3])
  imag_part(q*qv*conj(q))
end

function evenWave(x::AbstractFloat)
  # Any combination of unit vector input and component of output gives
  # a function that covers [-1,1] evenly.
  q=tumble(x)
  q/=norm(q)
  rotate(q,[0.0,0.0,1.0])[3]
end

graph=Figure()
x=range(0,30,length=450)
y=evenWave.(x)
lines(graph[1,1],x,y)
graph

end # module EvenWave
