# EvenWave

EvenWave computes a smooth function which covers the interval (-1,1) evenly; that is, if -1<a<b<1, {x:a<evenWave(x)<b} contains (b-a)/2 of the real line. It does this by rotating a sphere with a point marked on it by a product series of quaternions and taking one coordinate of the resulting point. The quaternions are versors encoding rotations about axes spaced by the golden angle by angles in a geometric sequence with ratio 1/e.
