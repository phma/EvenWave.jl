module EvenWave
export φz

using Quaternions

φturn=(√5-1)*π/2

φz=quat(cos(φturn/2),0,0,sin(φturn/2))

end # module EvenWave
