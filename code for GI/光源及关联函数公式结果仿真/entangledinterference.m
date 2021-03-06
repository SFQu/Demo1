%北师大博士论文P18 （3.1），纠缠光鬼干涉二阶关联函数
% clear
% b=0.05;%双缝缝宽，以下单位均为毫米
% d=0.45;%双缝间距
% L=702e-6;%351nm激光泵浦BBO晶体产生702nm纠缠光
% z=600;%BBO晶体到双缝和双缝到探测器距离之和
% for i=1:1601
%     x(i)=-8+0.01*(i-1);%探测器x2范围-8~+8毫米
%     G(i)=(sinc(pi*b*x(i)/(L*z))*(cos(pi*d*x(i)/(L*z))))^2;
% end
% plot(x,G);xlabel('探测器2位置');ylabel('纠缠光源二阶关联函数')%探测器x1=0

%研究下转换波长变化对纠缠光干涉分辨率的影响
clear
b=0.05;%双缝缝宽，以下单位均为毫米
d=0.45;%双缝间距
%L=702e-6;%351nm激光泵浦BBO晶体产生702nm纠缠光
z=600;%BBO晶体到双缝和双缝到探测器距离之和
[x,L]=meshgrid(-8:0.01:8,400e-6:50e-6:1600e-6);
G=(sinc(pi.*b.*x./(L.*z)).*(cos(pi.*d.*x./(L.*z)))).^2;
mesh(x,L,G);xlabel('探测器2位置');ylabel('下转换纠缠光波长');zlabel('纠缠光源二阶关联函数')%探测器x1=0

