Program Mathtest2
  
  COMPLEX, PARAMETER    :: MINUS_ONE = -1.0, x= 2.0
  COMPLEX               :: Z,y
  Real *8 :: w, q=1.0

  Z = SQRT(MINUS_ONE)
  y=asin(x)
  w=log(q-1)

  
  Print * , Z, y, w

End Program Mathtest2
