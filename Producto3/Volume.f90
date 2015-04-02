
Program Volume

Implicit NONE

Real :: radius ,h, vol
Real :: PI = 4.0 * atan(1.0) 
Integer :: model_n = 1 

print *, 'Enter a radius:'
read *, radius 

print *, 'Enter a height:'
read *, h


vol = PI *h*h*(3*radius - h ) / 3

print * , 'Program number =' , model_n
print * , 'Radius =' , radius
print * , 'Volume =' , vol

End Program Volume
