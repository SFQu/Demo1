clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ


Dir1= 'C:\Users\Administrator\Desktop';    %  �ļ���·��
Dir2= 'C:\Users\Administrator\Desktop';    %  �ļ���·��
Directory1 = 'C:\Users\Administrator\Desktop\(1)';    %  ��һ��ͼ���·�����Ա����ͼ���С
% Directory2 = 'J:\HBT\delay\20131226\00\2\1000.jpeg';    %  ��һ��ͼ���·�����Ա����ͼ���С
Num =1000;  %  ͼƬ�ļ���


Image = imread(Directory1, 'bmp');    %  ��ȡ��һ��ͼ��
[Row, Col] = size(Image); %  �õ�ͼ�����,����

% r01=400;  r02=403; r03=400; r04=403;
r1=1;   r11=768; r2=1;  r22=1024;                       %  ��ͼ��С
h=30;j=150;                                               %  ȡ��
single1=r11-r1+1;single2=r22-r2+1;   %��ͼ�ı߳�
 
% Im = zeros(single1,single2);          %  ����һ����ͼ��С����ֵ�����Ա�ͼ�����


ImageSump = zeros(single1,single2);   %  ����һ����ͼ��С����ֵ�����Ա�ͼ�����


ImageSumpp = zeros(1, 1);
% ImageSumpp0 = zeros(1, 1);
% Im01=zeros(r02-r01,r04-r03);
Im2=zeros(r11-r1+1,r22-r2+1);

Colg2 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ�������Ĺ���
ColG2 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������
% Colg02 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ�������Ĺ���
% ColG02 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������

 
tic

for I = 1 : Num    %  ѭ����NUM��ͼ���ۼ� 
    ImageI= 999+I; %ͼƬ��ţ����ڶ�ȡ
    FileName1 =[int2str(ImageI), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg
    FileName2 =[int2str(ImageI), '.bmp'];   
    Image1 = double(rgb2gray(imread([Dir1 FileName1],'bmp'))); %imread([Dir1 FileName1], 'jpeg');�������ļ����ƣ�Ϊ�˶�ȡͼ�� 
    Image2 = double(rgb2gray(imread([Dir2 FileName2],'bmp'))); %imread([Dir2 FileName2], 'jpeg');�������ļ����ƣ�Ϊ�˶�ȡͼ�񡣲�ͬ·����ȡͼ�� 

    Im2 =  Image2(r1:r11,r2:r22);   %��Image2�еľ�����ΪIm2
%     Im01=  Image1(r01:r02-1,r03:r04-1);  %����
    Im1= Image1(h,j);  %һ����
%     Im02 =  sum((sum(Im01))');
    ImageSump= ImageSump + double(Im2);   %Im2��NUM��ͼ�����
    ImageSumpp = ImageSumpp + double(Im1); %Im1��NUM��ͼ�����
%     ImageSumpp0 = ImageSumpp0 + double(Im02); %Im02��NUM��ͼ�����
 
%     I2 = ImageSumpp; %Im1ͼ�������Ϊƽ������
    ColG2 = ColG2 + Im1.*double(Im2); %1��2ͼƬ����������
%     ColG02 = ColG02 + Im02.*double(Im2);
     if mod(I,10)==0  %modȡģ���㣬��������ͬ��
        I/Num 
   toc  %tic toc ������ʾʱ��
     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
end    
ImageAvep = ImageSump./Num; %  ���Im2��ƽ��ͼ��
ImageAvepp = ImageSumpp./Num; %  ���Im1��ƽ��ͼ��

Colg2 =(ColG2./Num)./(ImageAvep.*ImageAvepp);  %ȥ��ϵ���Ĺ���ͼ��g2

Colg2nor = Colg2./max(max(Colg2));  %������һ��ͼ��

figure;
imshow(Colg2,[]);title('Colg2');
figure;
imshow(Colg2nor,[]);title('Colg2nor');


[rows,cols]=find(Colg2==max(max(Colg2)'));
rows,cols

figure;
plot(Colg2nor(rows:rows,r2:r22));
figure;
plot(Colg2(rows:rows,r2:r22));