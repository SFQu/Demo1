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

r01=400;  r02=403; r03=400; r04=403;
r1=1;   r11=768; r2=1;  r22=1024;%  ��ͼ��С

single01=r02-r01+1;single02=r04-r03+1;
single1=r11-r1+1;single2=r22-r2+1;   %��ͼ�ı߳�
 
% Im = zeros(single1,single2);          %  ����һ����ͼ��С����ֵ�����Ա�ͼ�����

ImageSump = zeros(single1,single2);   %  ����һ����ͼ��С����ֵ�����Ա�ͼ�����
ImageSumpp0 = zeros(1,1);
Im01=zeros(single01,single02);
Im2=zeros(single1,single2);

Colg02 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ�������Ĺ���
ColG02 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������

tic

for I = 1 : Num    %ѭ����NUM��ͼ���ۼ� 
    ImageI= 1000+I; %ͼƬ��ţ����ڶ�ȡ
    FileName1 =[int2str(ImageI), '.bmp'];    %�γ��ļ����ƣ���Image1.jpg
    FileName2 =[int2str(ImageI), '.bmp'];   
    Image1 = double(rgb2gray(imread([Dir1 FileName1],'bmp'))); %imread([Dir1 FileName1], 'jpeg');�������ļ����ƣ�Ϊ�˶�ȡͼ�� 
    Image2 = double(rgb2gray(imread([Dir2 FileName2],'bmp'))); %imread([Dir2 FileName2], 'jpeg');�������ļ����ƣ�Ϊ�˶�ȡͼ�񡣲�ͬ·����ȡͼ�� 

    Im2 =  Image2(r1:r11,r2:r22);   %��Image2�еľ�����ΪIm2
    Im01=  Image1(r01:r02,r03:r04);  %����
    Im02 =  sum((sum(Im01))');
    ImageSump= ImageSump + double(Im2);   %Im2��NUM��ͼ�����
    ImageSumpp0 = ImageSumpp0 + double(Im02); %Im02��NUM��ͼ�����
 
%     I2 = ImageSumpp; %Im1ͼ�������Ϊƽ������

    ColG02 = ColG02 + Im02.*double(Im2);
     if mod(I,10)==0  %modȡģ���㣬��������ͬ��
        I/Num 
   toc  %tic toc ������ʾʱ��
     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
end    
ImageAvep = ImageSump./Num; %  ���Im2��ƽ��ͼ��
ImageAvepp = ImageSumpp0./Num; %  ���Im1��ƽ��ͼ��

Colg02 =(ColG02./Num)./(ImageAvep.*ImageAvepp);  %ȥ��ϵ���Ĺ���ͼ��g2

Colg02nor = Colg02./max(max(Colg02));  %������һ��ͼ��

figure;
imshow(Colg02,[]);title('Colg02');
figure;
imshow(Colg02nor,[]);title('Colg02nor');


[rows,cols]=find(Colg02==max(max(Colg02)'));
rows,cols

figure;
plot(Colg02nor(rows:rows,r2:r22));
figure;
plot(Colg02(rows:rows,r2:r22));