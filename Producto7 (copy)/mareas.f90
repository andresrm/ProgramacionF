Module Constants
		Integer, parameter :: n=7657
		Integer, parameter :: d=48, md=24
		Integer, parameter :: m=1440
                Integer, parameter :: maxrecs=10000
End Module Constants

Program Tides

Use Constants
Implicit None 
	real, dimension(2,7657) :: Data !Donde Data(1,i) son las amplitudes y Data(2,i) dias 
	real :: ex=0  !Variable para comparar extremos de amplitud
	integer :: i
 


!Leer los datos del archivo 
	open(1, file='mareas5.csv', status='old')

		do i=1, n
		   read (1,*) Data(1,i), Data(2,i)
		end do


close (1)



!CALCULAR MAXIMOS Y MINIMOS

	!Máximos de mes:
	open(2, file='maxmes.dat')
	    call max(m,Data,2)
	close (2)

	!Mínimos mes:
	open(3, file='minmes.dat')
	    call min(m,Data,3)
	close (3)

	!Máximos de día:
	open(4, file='maxdia.dat')
	    call max(d,Data,4)
	close (4)

	!Mínimos de día
	open(5, file='mindia.dat')
	    call min(d,Data,5)
	close (5)

	!Máximos de medio día
	open(6, file='maxmed.dat')
	    call max(md,Data,6)
	close (6) 

	!Mínimos de medio día 
	open(7, file='minmed.dat')
	    call min(md,Data,7)
	close (7)




!CALCULAR PROMEDIOS

open(8, file='Promedios.dat')
	
	!Periodo de mes
	open(2, file='maxmes.dat')
		call Per(m,2,6)	 
	close (2)
	!Periodo de dia
	open(4, file='maxdia.dat')
		call Per(d,4,160)
	close (4)
	!Periodo cada medio dia
	open(6, file='maxmed.dat')
		call Per(md,6,320)  !320 : numero de datos en el archivo
	close (6)

close (8) 


end Program Tides




!SUBRUTINAS


!Maximos
Subroutine Max(r,v,f) ! Sea r parametro de día o mes, v arreglo, f numero de file
	use constants
		integer ::  r, i, u, p,f
		real :: ex
		real, dimension(2,7657) :: v

		do i=0, n, r
		ex=-2
		   do u=0, r
		   if((i+u).le.n) then
		      if(v(1,i+u)>ex) then
			 ex=v(1,i+u)
			 p=i+u
		      end if
		     end if
		   end do
     write (f,*) p, ex !!Se escribe el numero de dato al lado de el valor de la amplitud
		end do

end subroutine 





!Mínimos
Subroutine Min(r,v,f) 
	use constants
		integer ::  r, i, u, p,f
		real :: ex
		real, dimension(2,7657) :: v

		do i=0, n, r
		ex=2
		   do u=0, r
		   if((i+u).le.n) then
		      if(v(1,i+u)<ex) then
			 ex=v(1,i+u)
			 p=i+u
		      end if
		     end if
		   end do
		write(f,*) p, ex
		end do

end subroutine 


!Periodos
Subroutine Per(r,f,h)
	use constants
		integer :: r,f,i,h
		real :: x
		real, allocatable :: t(:)
                real, allocatable :: q(:)
                
                allocate  (t(h))
                allocate  (q(h-1))

		do i=1,h 
		   read (f,*) t(i), x
		end do
   
                do i=1,(h-1)
                   q(i)=t(i+1)-t(i)
                end do

!Se escribe r para diferenciar, se promedio el arreglo y muestra en terminos de dias
write(8,*) 'Periodo de ',r,sum(q)/(48*(h-1)),'dias'
              
              deallocate (t) 
              deallocate (q)
end subroutine

