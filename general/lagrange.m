% x0 = [0 pi/6 pi/4 pi/3 pi/2];
% y0 = [0 0.5 0.7071 0.8660 1];
% x = linspace(0,pi,50);
% M=1;
function [y,R]=lagrange(x0,y0,x,M)
    n=length(x0);
    m=length(x); 
    for i=1:m 
         z=x(i); 
         s=0.0; 
         for k=1:n 
             p=1.0; 
             q1=1.0;
             c1=1.0;
             for j=1:n 
                 if j~=k 
                     p=p*(z-x0(j))/(x0(k)-x0(j)); 
                 end 
                 q1=abs(q1*(z-x0(j)));
                 c1=c1*j;
             end 
             s=p*y0(k)+s; 
         end 
         y(i)=s; 
         R(i) = M * q1 / c1;
    end
end
