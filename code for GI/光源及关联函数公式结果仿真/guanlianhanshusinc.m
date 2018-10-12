clear
syms u v;
a=0.15;
d=0.45;
w=5;
s=0.01;
L=405e-6;
z0=450;
z1=300;
z2=600;
j=sqrt(-1);
s1=1/(2*s*s);
for k=1:2
A(k)=1/(2*w*w)+(-1)^k*j*v-j*pi/(L*z1);
B(k)=(1/(2*w*w)-(-1)^k*j*v)/(1/(2*w*w)+(-1)^k*j*v-j*pi/(L*z2));
C(k)=1/(2*w*w)-(-1)^k*j*v;
end
 for i=1:5
 x2=-5+0.05*(i-1)
 p1(i)=(j*pi/(L*z1)+j*pi/(L*z0)-pi*pi/(L*L*z1*z1*(A(1)-B(1)*C(1))))*u*u-2*pi*pi*x2(i)*B(1)*u/(L*L*z1*z2*(A(1)-B(1)*C(1)))
 p2(i)=(j*pi/(L*z1)+j*pi/(L*z0)-pi*pi/(L*L*z1*z1*(A(2)-B(2)*C(2))))*u*u-2*pi*pi*x2(i)*B(2)*u/(L*L*z1*z2*(A(2)-B(2)*C(2)))
 y(i)=exp(p1(i))+exp(p2(i))
 h(i)=int(y(i),u,-0.3,-0.15)%+int(y(i),u,0.15,0.3)
 g(i)=(abs(int(h(i),v,0,5000)))^2
 G(i)=vpa(g(i))
 end
 plot(x2,G)