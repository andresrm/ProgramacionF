program projectile_plot  
       implicit none  

! DECLARACION DE VARIABLES
       real :: u, a, t_max, a_grados, D, rho, C, At
       real :: x0, y0, vx0, vy0,  ax, ay, m,r
       real :: xi,xii,yi,yii,yi2
       real :: x(1000),y(1000)  
          integer :: i = 0
          real :: t=0, dt=0.05


! DECLARACION DE CONSTANTES
       real, parameter :: pi = 4.0*atan(1.0) 
       real, parameter :: g = 9.81

       write(*,*) 'Densidad del fluido: '
       read *, rho
       write(*,*) 'Radio de la esfera: '
       read *, r
       write(*,*) 'Masa:'   
       read *, m

       C=0.47
       At= pi*r*r
       D = rho*C*At/2.0
     

       write(*,*) 'Angulo inicial:'   
       read *, a_grados   
       write(*,*) 'Velocidad inicial:'   
       read *, u   
       write(*,*) 'Posicion inicial x:'   
       read *, x0   
       write(*,*) 'Posicion inicial y:'   
       read *, y0
 

!CONVERTIR ANGULO A RADIANES 
       a = a_grados*pi/180.0   
       
!COMPONENTES DE VELOCIDAD
       vx0 = u*cos(a)
       vy0 = u*sin(a)

!!!!
       t_max= 2000*dt
       xi=x0
       yi=y0

!ABRIR ARCHIVO .DAT
       open(1, file='drag.dat')   
 
!CALCULO DE LA TRAYECTORIA CON RESISTENCIA DEL AIRE        
       do              
            call  FUERZA(g,D,m,vx0,vy0,ax,ay)
            call  TRAYECT(xi,yi,vx0,vy0,ax,ay,dt,xii,yii)
             if (yi<0) then
               exit
            end if
!ESCRIBIR CON FORMATO
            write(1,1000) xi, yi
            1000 format (2f8.2)
!REDEFINIR VARIABLES
            vx0 = vx0 + ax*dt
            vy0 = vy0 + ay*dt
            xi=xii
            yi=yii
       end do   
       close(1)


!CALCULO DE LA TRAYECTORIA SIN RESISTENCIA DEL AIRE
!(SE CONSIDERA D=0 Y SE TOMAN VALORES INICIALES x(0), y(0), u)
       
       vx0 = u*cos(a)
       vy0 = u*sin(a)
       xi=x0
       yi2=y0
       dt=0.1

       open(1, file='nodrag.dat')   
 
       do              
            call  FUERZA(g,0.0,m,vx0,vy0,ax,ay)
            call  TRAYECT(xi,yi2,vx0,vy0,ax,ay,dt,xii,yii)

             if (yi2 < 0 ) then
               exit
            end if
!ESCRIBIR CON FORMATO
            write(1,1001) xi, yi2
		1001 format (2f8.2)
!REDEFINIR VARIABLES
            vx0 = vx0 + ax*dt
            vy0 = vy0 + ay*dt
            xi=xii
            yi2=yii
       end do   
       
       close(1)

       

  
end program projectile_plot 


! SUBRUTINA CALCULO DE TRAYECTORIA

Subroutine TRAYECT(x1,y1,vx,vy,axi,ayi,dti,x2,y2)
Implicit None
real :: x1,y1,vx,vy,axi,ayi,dti,x2,y2

x2= x1 + vx*dti + 0.5*axi*dti*dti

y2= y1 + vy*dti + 0.5*ayi*dti*dti

End Subroutine TRAYECT


! SUBRUTINA CALCULO DE FUERZA DE ARRASTRE

Subroutine FUERZA(g,Di,mi,vx,vy,axi,ayi)
Implicit None
real :: g,Di,mi,vx,vy,axi,ayi

 axi = -(Di/mi) * vx * vx
 ayi = -g - (Di/mi)*vy*vy

End Subroutine FUERZA
