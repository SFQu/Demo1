%����������ͬ
clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ
%o=imread('C:\Users\123456\Desktop\lena256.jpg');

o=zeros(256);%����˫��
o(:,70:100)=1;
o(:,150:180)=1;
%imhist(o)
%imshow(o)

num1 = 1000;  %  ͼƬ�ļ���
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
   r=a+b.*randn(256,256);%�ȹⳡ�����ֵΪ0������Ϊ1�ĸ�˹�ֲ�
   %r=randi([0,1],256,256);%����ʹ�õ�DMDֻ����0��1
   %r=randi([0,255],256,256);
    
    k=k+r;                  %����I2��x2���ֲܷ�
    h=h+sum(sum(r)).*r;     %��������R*I2��x2��
    
    s=double(o).*r;       %����S�ⳡ�ֲ�,�ɼ�������
    c=c+sum(sum(s)).*r;   %��������S*I2��x2��
    
    R=R+sum(sum(r));        %����R�ܹ�ǿ
    S=S+sum(sum(s));        %����S�ܹ�ǿ
    
    if mod(j,10)==0  %modȡģ���㣬��������ͬ��
    j/num 
    toc  %tic toc ������ʾʱ��
    end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
    
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
% title('');xlabel('ʱ��(s)');ylabel('��(^��)');

% %������������
% %������ʦ�ּ��㷽��
O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
Avehuidu = sum(sum(O))./(256*256);
sub1= O-Avehuidu;
sub2= Gd-O;
SNR1=sum(sum(sub1.*sub1))./sum(sum(sub2.*sub2))
% 
% %��ֵ�����PSNR���㷽��
O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
sub1 = Gd-O; %���ڴ洢����ԭͼ�Ĳ�
MSE1 = sum(sum(sub1 .* sub1)')/(256*256);
SNR2 = 10*log(255*255/MSE1)

% %�ο��۷ֲ���ͬ
% clear all;    %  �������
% clc;    %  �����Ļ
% close all;    %  �ر�ͼƬ
% %o=imread('C:\Users\123456\Desktop\lena256.jpg');
% 
% o=zeros(256);%����˫��
% o(:,70:100)=1;
% o(:,150:180)=1;
% %imhist(o)
% %imshow(o)
% 
% num  = 20000; %  ͼƬ�ļ���
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
%     %�ȹⳡ�����ֵΪ0������Ϊ1�ĸ�˹�ֲ�
%     r=a+b.*randn(256,256);
%     k=k+r;                  %����I2��x2���ֲܷ�
%     h=h+sum(sum(r)).*r;     %��������R*I2��x2��
%     
%     s=double(o).*r;       %����S�ⳡ�ֲ�
%     c=c+sum(sum(s)).*r;   %��������S*I2��x2��
%     
%     R=R+sum(sum(r));        %����R�ܹ�ǿ
%     S=S+sum(sum(s));        %����S�ܹ�ǿ
%     
%     Ct=c./num;
%     Cf=Ct-(R./num).*(k./num);
%     Cd=c./num-(S./num)./(R./num).*h./num;
%     
%     
%     %����ʹ�õ�DMDֻ����0��1
%     r1=randi([0,1],256,256);
%     k1=k1+r1;                  %����I2��x2���ֲܷ�
%     h1=h1+sum(sum(r1)).*r1;     %��������R*I2��x2��
%     
%     s1=double(o).*r1;       %����S�ⳡ�ֲ�
%     c1=c1+sum(sum(s1)).*r1;   %��������S*I2��x2��
%     
%     R1=R1+sum(sum(r1));        %����R�ܹ�ǿ
%     S1=S1+sum(sum(s1));        %����S�ܹ�ǿ
%     
%     Ct1=c1./num;
%     Cf1=Ct1-(R1./num).*(k1./num);
%     Cd1=c1./num-(S1./num)./(R1./num).*h1./num;
%     
% %     %0��255�ֲ�
% %     r2=randi([0,255],256,256);
% %     k2=k2+r2;                  %����I2��x2���ֲܷ�
% %     h2=h2+sum(sum(r2)).*r2;     %��������R*I2��x2��
% %     
% %     s2=double(o).*r2;       %����S�ⳡ�ֲ�
% %     c2=c2+sum(sum(s2)).*r2;   %��������S*I2��x2��
% %     
% %     R2=R2+sum(sum(r2));        %����R�ܹ�ǿ
% %     S2=S2+sum(sum(s2));        %����S�ܹ�ǿ
% %     
% %     Ct2=c2./num;
% %     Cf2=Ct2-(R2./num).*(k2./num);
% %     Cd2=c2./num-(S2./num)./(R2./num).*h2./num;
%     
%     if mod(j,10)==0  %modȡģ���㣬��������ͬ��
%     j/num 
%     toc  %tic toc ������ʾʱ��
%     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
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

% %���벻ͬ����
% clear all;    %  �������
% clc;    %  �����Ļ
% close all;    %  �ر�ͼƬ
% o=imread('C:\Users\123456\Desktop\lena256.jpg');
% 
% % o=zeros(256);%����˫��
% % o(:,70:100)=1;
% % o(:,150:180)=1;
% %imhist(o)
% %imshow(o)
% 
% num  = 10000; %  ͼƬ�ļ���
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
%     %�ȹⳡ�����ֵΪ0������Ϊ1�ĸ�˹�ֲ�
%     r=randi([0,1],256,256);
%     k=k+r;                  %����I2��x2���ֲܷ�
%     h=h+sum(sum(r)).*r;     %��������R*I2��x2��
%     
%     s=double(o).*r;       %����S�ⳡ�ֲ�
%     c=c+sum(sum(s)).*r;   %��������S*I2��x2��
%     
%     R=R+sum(sum(r));        %����R�ܹ�ǿ
%     S=S+sum(sum(s));        %����S�ܹ�ǿ
%     
%     Ct=c./num;
%     Cf=Ct-(R./num).*(k./num);
%     Cd=c./num-(S./num)./(R./num).*h./num;
%     
%     
%     %����ʹ�õ�DMDֻ����0��1
%     r1=randi([0,1],256,256);
%     k1=k1+r1;                  %����I2��x2���ֲܷ�
%     h1=h1+sum(sum(r1)).*r1;     %��������R*I2��x2��
%     
%     s1=double(o).*r1+randn(256,256);       %����S�ⳡ�ֲ�
%     c1=c1+sum(sum(s1)).*r1;   %��������S*I2��x2��
%     
%     R1=R1+sum(sum(r1));        %����R�ܹ�ǿ
%     S1=S1+sum(sum(s1));        %����S�ܹ�ǿ
%     
%     Ct1=c1./num;
%     Cf1=Ct1-(R1./num).*(k1./num);
%     Cd1=c1./num-(S1./num)./(R1./num).*h1./num;
%     
%     
%     r2=randi([0,1],256,256);
%     k2=k2+r2;                  %����I2��x2���ֲܷ�
%     h2=h2+sum(sum(r2)).*r2;     %��������R*I2��x2��
%     
%     s2=double(o).*r2+10.*randn(256,256);       %����S�ⳡ�ֲ�
%     c2=c2+sum(sum(s2)).*r2;   %��������S*I2��x2��
%     
%     R2=R2+sum(sum(r2));        %����R�ܹ�ǿ
%     S2=S2+sum(sum(s2));        %����S�ܹ�ǿ
%     
%     Ct2=c2./num;
%     Cf2=Ct2-(R2./num).*(k2./num);
%     Cd2=c2./num-(S2./num)./(R2./num).*h2./num;
%     
%     if mod(j,10)==0  %modȡģ���㣬��������ͬ��
%     j/num 
%     toc  %tic toc ������ʾʱ��
%     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
%        
% end
% subplot(1,3,1);
% imshow(Cd)
% subplot(1,3,2);
% imshow(Cd1)
% subplot(1,3,3);
% imshow(Cd2)
