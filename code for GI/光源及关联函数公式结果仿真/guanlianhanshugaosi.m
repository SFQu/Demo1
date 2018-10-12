clear
syms u;
a=0.15;
d=0.45;
w=5;
s=0.01;
L=810e-6;
z0=450;
z1=300;
z2=600;
j=sqrt(-1);
A=1/(2*w*w)+1/(2*s*s)-j*pi/(L*z1);
B=(1/(2*w*w)-1/(2*s*s))/(1/(2*w*w)+1/(2*s*s)-j*pi/(L*z2));
C=1/(2*w*w)-1/(2*s*s);
for i=1:101
x2(i)=-5+0.1*(i-1);
y(i)=exp((j*pi/(L*z1)+j*pi/(L*z0)-pi*pi/(L*L*z1*z1*(A-B*C)))*u*u-2*pi*pi*x2(i)*B*u/(L*L*z1*z2*(A-B*C)));
G(i)=abs(int(y(i),u,-0.3,-0.15)+int(y(i),u,0.15,0.3));
g(i)=vpa(G(i)^2)
end
max(g)
%plot(x2,g/max(g))
