%测量次数不同
clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片
%o=imread('C:\Users\123456\Desktop\lena256.jpg');

o=zeros(256);%产生双缝
o(:,70:100)=1;
o(:,150:180)=1;
%imhist(o)
%imshow(o)

num1 = 1000;  %  图片文件数
num2 = 5000;
num3 = 10000;
num  = 20000;
a=0;b=1;
R=0;
S=0;
c=zeros(256);
r=zeros(256);
k=zeros(256);
h=zeros(256);
tic
for j=1:num
   r=a+b.*randn(256,256);%热光场满足均值为0，方差为1的高斯分布
   %r=randi([0,1],256,256);%我们使用的DMD只能是0和1
   %r=randi([0,255],256,256);
    
    k=k+r;                  %计算I2（x2）总分布
    h=h+sum(sum(r)).*r;     %关联计算R*I2（x2）
    
    s=double(o).*r;       %计算S光场分布,可加入噪声
    c=c+sum(sum(s)).*r;   %关联计算S*I2（x2）
    
    R=R+sum(sum(r));        %计算R总光强
    S=S+sum(sum(s));        %计算S总光强
    
    if mod(j,10)==0  %mod取模运算，结果与除数同号
    j/num 
    toc  %tic toc 用于显示时间
    end  %显示已计算的进度和时间
    
    if j==num1
        c1=c;
        R1=R;
        S1=S;
        k1=k;
        h1=h;
        Ct1=c1./num1;
        Cf1=Ct1-(R1./num1).*(k1./num1);
        Cd1=c1./num1-(S1./num1)./(R1./num1).*h1./num1; 
        Gd1=uint8(round(255 * ((Cd1-min(min(Cd1)'))./(max(max(Cd1)')-min(min(Cd1)')))));
%         figure;
%         imshow(Ct1);
%         figure;
%         imshow(Cf1);
        figure;
        imshow(Cd1);
    end
    
    if j==num2
        c2=c;
        R2=R;
        S2=S;
        k2=k;
        h2=h;
        Ct2=c2./num2;
        Cf2=Ct2-(R2./num2).*(k2./num2);
        Cd2=c2./num2-(S2./num2)./(R2./num2).*h2./num2; 
        Gd2=uint8(round(255 * ((Cd2-min(min(Cd2)'))./(max(max(Cd2)')-min(min(Cd2)')))));
%         figure;
%         imshow(Ct2);
%         figure;
%         imshow(Cf2);
        figure;
        imshow(Cd2);
    end
    
    if j==num3
        c3=c;
        R3=R;
        S3=S;
        k3=k;
        h3=h;
        Ct3=c3./num3;
        Cf3=Ct3-(R3./num3).*(k3./num3);
        Cd3=c3./num3-(S3./num3)./(R3./num3).*h3./num3;
        Gd3=uint8(round(255 * ((Cd3-min(min(Cd3)'))./(max(max(Cd3)')-min(min(Cd3)')))));
%         figure;
%         imshow(Ct3);
%         figure;
%         imshow(Cf3);
        figure;
        imshow(Cd3);
    end
       
end

Ct=c./num;
%Ctn=Ct/max(max(Ct)');
Cf=Ct-(R./num).*(k./num);
%Cfn=Cf/max(max(Cf)');
Cd=Ct-(S./num)./(R./num).*h./num;  

% Gt=uint8(round(255 * ((Ct-min(min(Ct)'))./(max(max(Ct)')-min(min(Ct)')))));
% Gf=uint8(round(255 * ((Cf-min(min(Cf)'))./(max(max(Cf)')-min(min(Cf)')))));
Gd=uint8(round(255 * ((Cd-min(min(Cd)'))./(max(max(Cd)')-min(min(Cd)')))));

% figure;
% imshow(Ct)
% figure;
% imshow(Ctn)
% figure;
% imshow(Cf)
% figure;
% imshow(Cfn)
figure;
imshow(Cd)
% figure;
% imshow(Gd)
%V=(max(max(Cd)')-min(min(Cd)'))./(max(max(Cd)')+min(min(Cd)'))

% subplot(1,4,1);
% imshow(Cf1)
% subplot(1,4,2);
% imshow(Cf2)
% subplot(1,4,3);
% imshow(Cf3)
% subplot(1,4,4);
% imshow(Cf)

% subplot(1,4,1);
% imshow(Cd1)
% subplot(1,4,2);
% imshow(Cd2)
% subplot(1,4,3);
% imshow(Cd3)
% subplot(1,4,4);
% imshow(Cd)
% title('');xlabel('时间(s)');ylabel('角(^。)');

% %下面计算信噪比
% %李明飞师兄计算方法
O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
Avehuidu = sum(sum(O))./(256*256);
sub1= O-Avehuidu;
sub2= Gd-O;
SNR1=sum(sum(sub1.*sub1))./sum(sum(sub2.*sub2))
% 
% %峰值信噪比PSNR计算方法
O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
sub1 = Gd-O; %用于存储像与原图的差
MSE1 = sum(sum(sub1 .* sub1)')/(256*256);
SNR2 = 10*log(255*255/MSE1)

% %参考臂分布不同
% clear all;    %  清除变量
% clc;    %  清除屏幕
% close all;    %  关闭图片
% %o=imread('C:\Users\123456\Desktop\lena256.jpg');
% 
% o=zeros(256);%产生双缝
% o(:,70:100)=1;
% o(:,150:180)=1;
% %imhist(o)
% %imshow(o)
% 
% num  = 20000; %  图片文件数
% a=0;b=1;
% R=0;
% S=0;
% c=zeros(256);
% r=zeros(256);
% k=zeros(256);
% h=zeros(256);
% 
% R1=0;
% S1=0;
% c1=zeros(256);
% r1=zeros(256);
% k1=zeros(256);
% h1=zeros(256);
% 
% R2=0;
% S2=0;
% c2=zeros(256);
% r2=zeros(256);
% k2=zeros(256);
% h2=zeros(256);
% 
% tic
% for j=1:num
%     
%     %热光场满足均值为0，方差为1的高斯分布
%     r=a+b.*randn(256,256);
%     k=k+r;                  %计算I2（x2）总分布
%     h=h+sum(sum(r)).*r;     %关联计算R*I2（x2）
%     
%     s=double(o).*r;       %计算S光场分布
%     c=c+sum(sum(s)).*r;   %关联计算S*I2（x2）
%     
%     R=R+sum(sum(r));        %计算R总光强
%     S=S+sum(sum(s));        %计算S总光强
%     
%     Ct=c./num;
%     Cf=Ct-(R./num).*(k./num);
%     Cd=c./num-(S./num)./(R./num).*h./num;
%     
%     
%     %我们使用的DMD只能是0和1
%     r1=randi([0,1],256,256);
%     k1=k1+r1;                  %计算I2（x2）总分布
%     h1=h1+sum(sum(r1)).*r1;     %关联计算R*I2（x2）
%     
%     s1=double(o).*r1;       %计算S光场分布
%     c1=c1+sum(sum(s1)).*r1;   %关联计算S*I2（x2）
%     
%     R1=R1+sum(sum(r1));        %计算R总光强
%     S1=S1+sum(sum(s1));        %计算S总光强
%     
%     Ct1=c1./num;
%     Cf1=Ct1-(R1./num).*(k1./num);
%     Cd1=c1./num-(S1./num)./(R1./num).*h1./num;
%     
% %     %0到255分布
% %     r2=randi([0,255],256,256);
% %     k2=k2+r2;                  %计算I2（x2）总分布
% %     h2=h2+sum(sum(r2)).*r2;     %关联计算R*I2（x2）
% %     
% %     s2=double(o).*r2;       %计算S光场分布
% %     c2=c2+sum(sum(s2)).*r2;   %关联计算S*I2（x2）
% %     
% %     R2=R2+sum(sum(r2));        %计算R总光强
% %     S2=S2+sum(sum(s2));        %计算S总光强
% %     
% %     Ct2=c2./num;
% %     Cf2=Ct2-(R2./num).*(k2./num);
% %     Cd2=c2./num-(S2./num)./(R2./num).*h2./num;
%     
%     if mod(j,10)==0  %mod取模运算，结果与除数同号
%     j/num 
%     toc  %tic toc 用于显示时间
%     end  %显示已计算的进度和时间
%        
% end
% 
% figure;
% imshow(Cd)
% figure;
% imshow(Cd1)
% subplot(1,3,1);
% imshow(Cd)
% subplot(1,3,2);
% imshow(Cd1)
% subplot(1,3,3);
% imshow(Cd2)

% %加入不同噪声
% clear all;    %  清除变量
% clc;    %  清除屏幕
% close all;    %  关闭图片
% o=imread('C:\Users\123456\Desktop\lena256.jpg');
% 
% % o=zeros(256);%产生双缝
% % o(:,70:100)=1;
% % o(:,150:180)=1;
% %imhist(o)
% %imshow(o)
% 
% num  = 10000; %  图片文件数
% a=0;b=1;
% R=0;
% S=0;
% c=zeros(256);
% r=zeros(256);
% k=zeros(256);
% h=zeros(256);
% 
% R1=0;
% S1=0;
% c1=zeros(256);
% r1=zeros(256);
% k1=zeros(256);
% h1=zeros(256);
% 
% R2=0;
% S2=0;
% c2=zeros(256);
% r2=zeros(256);
% k2=zeros(256);
% h2=zeros(256);
% 
% tic
% for j=1:num
%     
%     %热光场满足均值为0，方差为1的高斯分布
%     r=randi([0,1],256,256);
%     k=k+r;                  %计算I2（x2）总分布
%     h=h+sum(sum(r)).*r;     %关联计算R*I2（x2）
%     
%     s=double(o).*r;       %计算S光场分布
%     c=c+sum(sum(s)).*r;   %关联计算S*I2（x2）
%     
%     R=R+sum(sum(r));        %计算R总光强
%     S=S+sum(sum(s));        %计算S总光强
%     
%     Ct=c./num;
%     Cf=Ct-(R./num).*(k./num);
%     Cd=c./num-(S./num)./(R./num).*h./num;
%     
%     
%     %我们使用的DMD只能是0和1
%     r1=randi([0,1],256,256);
%     k1=k1+r1;                  %计算I2（x2）总分布
%     h1=h1+sum(sum(r1)).*r1;     %关联计算R*I2（x2）
%     
%     s1=double(o).*r1+randn(256,256);       %计算S光场分布
%     c1=c1+sum(sum(s1)).*r1;   %关联计算S*I2（x2）
%     
%     R1=R1+sum(sum(r1));        %计算R总光强
%     S1=S1+sum(sum(s1));        %计算S总光强
%     
%     Ct1=c1./num;
%     Cf1=Ct1-(R1./num).*(k1./num);
%     Cd1=c1./num-(S1./num)./(R1./num).*h1./num;
%     
%     
%     r2=randi([0,1],256,256);
%     k2=k2+r2;                  %计算I2（x2）总分布
%     h2=h2+sum(sum(r2)).*r2;     %关联计算R*I2（x2）
%     
%     s2=double(o).*r2+10.*randn(256,256);       %计算S光场分布
%     c2=c2+sum(sum(s2)).*r2;   %关联计算S*I2（x2）
%     
%     R2=R2+sum(sum(r2));        %计算R总光强
%     S2=S2+sum(sum(s2));        %计算S总光强
%     
%     Ct2=c2./num;
%     Cf2=Ct2-(R2./num).*(k2./num);
%     Cd2=c2./num-(S2./num)./(R2./num).*h2./num;
%     
%     if mod(j,10)==0  %mod取模运算，结果与除数同号
%     j/num 
%     toc  %tic toc 用于显示时间
%     end  %显示已计算的进度和时间
%        
% end
% subplot(1,3,1);
% imshow(Cd)
% subplot(1,3,2);
% imshow(Cd1)
% subplot(1,3,3);
% imshow(Cd2)
