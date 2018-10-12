%==========================================================================
% Institute of Physics
% Chinese Academy of Sciences
% 8 Nansanjie, Zhongguancun
% D-B34
% Beijing 100190, China
% Tel: (86)-10-82649593
% Aixin Zhang,  Ming-Fei Li L04
% TEl:18210242715
% mail:winter_heart@qq.com
%==========================================================================
%==========================================================================

clear all;    %  �������
clc;          %  �����Ļ
close all;    %  �ر�ͼƬ


Num = 2000;                  %  ͼƬ�ļ���
single1=200; single2=200;    %  ��������ͼ���С
h=100; j=100;                %  Ͱ̽����ȡ��

ImageSump = zeros(single1,single2);   %  ����һ����ͼ��С����ֵ�����Ա�ͼ�����
ImageSumpp = 0;

Colg2 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ�������Ĺ���
ColG2 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������
 
tic

for I = 1 : Num    %  ѭ����NUM��ͼ���ۼ� 
    ImageI=999+I;  %  ͼƬ��ţ����ڶ�ȡ
    
    Image1 = 255 .* rand(single1,single2); 
    noise  = rand(single1,single2).*5;      %����
    Image2 = Image1;                        %�ɼ�������

    Im1=  Image1(h,j);
    ImageSump= ImageSump + double(Image2);   %Im2��NUM��ͼ�����
    ImageSumpp = ImageSumpp + double(Im1); %Im1��NUM��ͼ�����
 
    ColG2 = ColG2 + Im1.*double(Image2); %1��2ͼƬ����������
     if mod(I,10)==0  %modȡģ���㣬��������ͬ��
        I/Num 
   toc  %tic toc ������ʾʱ��
     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
end    
ImageAvep = ImageSump./Num; %  ���Image2��ƽ��ͼ��
ImageAvepp = ImageSumpp./Num; %  ���Im1��ƽ��ͼ��

Colg2 =(ColG2./Num)./(ImageAvep.*ImageAvepp);   %ȥ��ϵ���Ĺ���ͼ��g2
Colg2nor = Colg2/max(max(Colg2));               %������һ��ͼ��
Colg2flu =Colg2-1; %�������ͼ��
figure;
imshow(Colg2,[]);title('HBT');
figure;
imshow(Colg2nor,[]);title('HBT��һ��');
figure;
imshow(Colg2flu,[]);title('HBT����');

figure;
plot(Colg2(1:single1,100:100));