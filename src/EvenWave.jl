module EvenWave
export φz,rotx

using Quaternions

φturn=(√5-1)*π/2

φz=quat(cos(φturn/2),0,0,sin(φturn/2))

function rotx(θ::AbstractFloat)
  quat(cos(θ),sin(θ),0,0)
end

end # module EvenWave
