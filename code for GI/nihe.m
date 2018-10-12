clear
x=[500:1500:8000];
y1=[0.5697 0.6385	0.8484	0.8851	0.9627	1.0560];
y2=[0.8445	1.2726	1.6110	1.8348	2.0968	2.4034];
y3=[0.4836	0.5830	0.7714	0.8933	1.0174	1.1073];
y4=[0.8802	1.2846	1.5432	1.8041	1.9839	2.2511];
% plot(x,y1,'--k+');xlabel('记录位置');ylabel('物体宽度');
% hold on
% plot(x,y2,'--ro');xlabel('记录位置');ylabel('物体宽度');
% hold on
% plot(x,y3,'-b*');xlabel('记录位置');ylabel('物体宽度');
% hold on
% plot(x,y4,'--g.');xlabel('记录位置');ylabel('物体宽度');
% hold on
p1=polyfit(x,y1,4);%做x和y的四阶多项式拟合p1
y1=polyval(p1,x);%从p1上选取横坐标为x的点得到纵坐标y1
p2=polyfit(x,y2,4);
y2=polyval(p2,x);
p3=polyfit(x,y3,4);
y3=polyval(p3,x);
p4=polyfit(x,y4,4);
y4=polyval(p4,x);
plot(x,y1,'--k+')
hold on
plot(x,y2,'--ro')
hold on
plot(x,y3,'-b*')
hold on
plot(x,y4,'--g.')
hold on