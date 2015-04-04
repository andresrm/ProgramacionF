  program projectile_plot  
       implicit none  
       !Defining constants:  
       real, parameter :: pi = 4.0*atan(1.0) 
       real :: u, a, t, a_grados  , Tt, H, R
       real, parameter :: g = 9.81  
       real:: x,y  
          integer :: i 

       !where g is gravity, pi is "pi"   
       !u is object's initial velocity   
       !a is object's initial angle   
       !t is time during the simulation   
       !x and y are arrays with 150 rows   
       !Seek user input   
       write(*,*) 'Enter angle of projectile (Real)'   
       read *, a_grados   
       write(*,*) 'Enter velocity of projectile (Real)'   
       read *, u   
       !Convert angle to radians   
       a = a_grados*pi/180.0   
       !open .dat file and start writing on it using the algorithm   
      
     
       i=0

       open(1, file='proj.dat')   
      

       do  while ( y >= 0 )
            !displacement of object in x and y direction   
            t = (float(i)*0.01)   
            x = u*cos(a)*t   
            y = u*sin(a)*t - 0.5*g*t*t   
            !write output in file "proj.dat" for plotting   
            write(1,*) x, y  
            !kill the loop when the object hits the ground    
            i = i + 1
       end do   
       close(1)   
       !close file
       
Tt = 2*u*sin(a)/g
H = u*u*sin(a)*sin(a)/(2*g)
R = u*u*sin(2*a)/g

       write(*,*) 'Time of flight:', Tt
       write(*,*) 'Maximum height:', H
       write(*,*) 'Maximum distance:', R

   
  end program projectile_plot 
