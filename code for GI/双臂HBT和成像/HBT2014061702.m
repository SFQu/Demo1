clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ


Dir1= 'C:\Users\Administrator\Desktop\2014.06.17.02\';    %  �ļ���·��
Dir2= 'C:\Users\Administrator\Desktop\2014.06.17.02\';    %  �ļ���·��
Directory1 = 'C:\Users\Administrator\Desktop\2014.06.17.02\1001.bmp';    %  ��һ��ͼ���·�����Ա����ͼ���С
Num =1100;  %  ͼƬ�ļ���


Image = imread(Directory1, 'bmp');    %  ��ȡ��һ��ͼ��
[Row, Col] = size(Image); %  �õ�ͼ�����,����


r1=393;   r11=867; r2=1062;  r22=1596;                       %  ��ͼ��С
h=480;j=846;                                               %  ȡ��
single1=r11-r1+1;single2=r22-r2+1;   %��ͼ�ı߳�
 



ImageSump = zeros(single1,single2);   %  ����һ����ͼ��С����ֵ�����Ա�ͼ�����


ImageSumpp = zeros(1, 1);

Im2=zeros(r11-r1+1,r22-r2+1);

Colg2 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ�������Ĺ���
ColG2 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������


 
tic

for I = 1 : Num    %  ѭ����NUM��ͼ���ۼ� 
    ImageI= 1000+I; %ͼƬ��ţ����ڶ�ȡ
    FileName1 =[int2str(ImageI), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg
    FileName2 =[int2str(ImageI), '.bmp'];   
 
    Image1 = double(imread([Dir1 FileName1],'bmp')); 
    Image2 = double(imread([Dir2 FileName2],'bmp')); 

    Im2 =  Image2(r1:r11,r2:r22);   %��Image2�еľ�����ΪIm2

    Im1= Image1(h,j);  %һ����

    ImageSump= ImageSump + double(Im2);   %Im2��NUM��ͼ�����
    ImageSumpp = ImageSumpp + double(Im1); %Im1��NUM��ͼ�����

    ColG2 = ColG2 + Im1.*double(Im2); %1��2ͼƬ����������

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