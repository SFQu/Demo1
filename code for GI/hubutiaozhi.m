%ʹ�ü�������ɵ�ɢ��ͼ����Ϊ�ο�̽��������ֵ
clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ

%o=imread('C:\Users\123456\Desktop\lena256.jpg');
o=imread('C:\Users\Administrator\Desktop\20150623\����ͼƬ\a256.bmp');
% o=rgb2gray(o);
% o=zeros(256);%����˫��
% o(:,70:100)=1;
% o(:,150:180)=1;
% b=ones(2)

num =2000;  %ͼƬ�ļ���
% num1=6500;
% num2=2000;
% num3=3500;
 
h=256;j=256;
 
ImageSum1 = 0;                       %  ���ڼ���<R>  
ImageSum2 = 0;                        %  ���ڼ���<S>  
ImageSum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
g= zeros(h,j);
G= zeros(h,j);
ImageAvep1 = zeros(h,j);
ImageAvep2 = zeros(h,j);
ImageAvep22 = zeros(h,j);
 
Image1Sum1 = 0;                       %  ���ڼ���<R>  
Image1Sum2 = 0;                        %  ���ڼ���<S>  
Image1Sum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
g1= zeros(h,j);
G1= zeros(h,j);
Image1Avep1 = zeros(h,j);
Image1Avep2 = zeros(h,j);
Image1Avep22 = zeros(h,j);
 
Image2Sum1 = 0;                       %  ���ڼ���<R>  
Image2Sum2 = 0;                        %  ���ڼ���<S>  
Image2Sum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
g2= zeros(h,j);
G2= zeros(h,j);
Image2Avep1 = zeros(h,j);
Image2Avep2 = zeros(h,j);
Image2Avep22 = zeros(h,j);
 
Image3Sum1 = 0;                       %  ���ڼ���<R>  
Image3Sum2 = 0;                        %  ���ڼ���<S>  
Image3Sum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
g3= zeros(h,j);
G3= zeros(h,j);
Image3Avep1 = zeros(h,j);
Image3Avep2 = zeros(h,j);
Image3Avep22 = zeros(h,j);

Dir1= 'E:\���ͼƬ\������\���\';    %  �ļ���·��

tic
for I = 1 : num    %  ѭ����NUM��ͼ���ۼ� 
    Imagei=2*I-1; %ͼƬ��ţ����ڶ�ȡ
    Imagej=2*I;
    FileName1 =['1_1_',int2str(Imagei), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg  
    FileName2 =['1_1_',int2str(Imagej), '.bmp'];
    %Image1 = imread([Dir1 FileName1],'bmp');%�ο�̽�����ⳡ�ֲ�
%     a=imread([Dir1 FileName1],'jpg');%�ο�̽�����ⳡ�ֲ�

    Image1=imread([Dir1 FileName1],'bmp');%�ο�̽�����ⳡ�ֲ�
    Image11=imread([Dir1 FileName2],'bmp');
    Image2 = double(Image1).*double(o);%Ͱ̽�����ⳡ�ֲ�,�����Ҷ�ͼ��ʱע�������������
    Image22 = double(Image11).*double(o);
    
    Ima1=sum(sum(Image2));          %Ͱ̽�����ܹ�ǿS
    Ima2=sum(sum(Image22)); 
    Ima=Ima1-Ima2;
    
    Imb=sum(sum(Image1));          %�ο�̽�����ܹ�ǿR
   
    ImageSum1 = ImageSum1 + double(Ima);      %S�ܹ�ǿ
% ImageSum1 = ImageSum1 + double(Ima1)+ double(Ima2); 
    ImageSum2 = ImageSum2 + double(Imb);      %R�ܹ�ǿ
    ImageSum22 = ImageSum22 + double(Image1);     %����I2(x2)
    
    G = G + Ima.*double(Image1);              %��������S*I2(x2)
% 	G = G + Ima1.*double(Image1)+ Ima2.*double(Image1); 
    g  = g + Imb.*double(Image1);                %����R*I2(x2)
    
    ImageAvep1 = ImageSum1./num;         %����S��ƽ��ֵ
    ImageAvep2 = ImageSum2./num;         %����R��ƽ��ֵ 
    ImageAvep22 = ImageSum22./num;        %����R��ƽ��ͼ��

    if mod(I,10)==0  %modȡģ���㣬��������ͬ��
    I/num 
    toc  %tic toc ������ʾʱ��
    end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��   
  

end

% Gt = G./num;                             %��ͳ������
% Gg = G./num./(ImageAvep1.*ImageAvep22); %��һ��������
% Gf = G./num - ImageAvep1.*ImageAvep22;    %�������ͼ��
Gd = G./num - ImageAvep1./ImageAvep2 .* g./num; %��ֹ�����


% CGt=uint8(round(255 * ((Gt-min(min(Gt)))./(max(max(Gt))-min(min(Gt))))));
% % CGg=uint8(round(255 * ((Gg-min(min(Gg)))./(max(max(Gg))-min(min(Gg))))));
% CGf=uint8(round(255 * ((Gf-min(min(Gf)))./(max(max(Gf))-min(min(Gf))))));
CGd=uint8(round(255 * ((Gd-min(min(Gd)))./(max(max(Gd))-min(min(Gd))))));
 
% figure;
% imshow(CGt)
% % figure;
% % imshow(CGg)
% figure;
% imshow(CGf)
figure;
imshow(CGd)
% imwrite(CGt,'C:\Users\Administrator\Desktop\t.bmp');
% % imwrite(CGg,'C:\Users\Administrator\Desktop\g.bmp');
% imwrite(CGf,'C:\Users\Administrator\Desktop\f.bmp');
imwrite(CGd,'C:\Users\Administrator\Desktop\d400.bmp');