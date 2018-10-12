clc
clear all
lamd=1.55*10.^-6;
v=3*10.^8;
A=1*10;
[z,t] = meshgrid(1:1:20);


% e=A*exp(i*(2*pi/lamd-v*t));
 e=A*cos((2*pi/lamd*z-v*t));
% e=A*exp(i*(2*pi/lamd*z-v*t))
p0=1*10;
p=p0*exp(-i*(2*pi*v)/lamd*t);

I=p*conj(p);
mesh(e)
% EE=mean(p*I,3)
%  plot(EE);

 
% I=A*exp(i*(2*pi/lamd*z-v*t))*(A*exp(-i*(2*pi/lamd*z-v*t)));
% hold on
% I=e*conj(e);
% mesh(I)
%     