
Program Circlearea

Implicit None

Real :: radius , circum , area
Real :: PI = 4.0 * atan(1.0) 
Integer :: model_n = 1 

print *, 'Enter a radius:'
read *, radius 
circum = 2.0 * PI * radius
area = radius * radius * PI
print * , 'Program number =' , model_n
print * , 'Radius =' , radius
print * , 'Circumference =' , circum
print * , 'Area =' , area

End Program Circlearea
