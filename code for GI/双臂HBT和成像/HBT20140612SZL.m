clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片


Dir1= 'C:\Users\Administrator\Desktop';    %  文件夹路径
Dir2= 'C:\Users\Administrator\Desktop';    %  文件夹路径
Directory1 = 'C:\Users\Administrator\Desktop\(1)';    %  第一幅图像的路径，以便测试图像大小
% Directory2 = 'J:\HBT\delay\20131226\00\2\1000.jpeg';    %  第一幅图像的路径，以便测试图像大小
Num =1000;  %  图片文件数


Image = imread(Directory1, 'bmp');    %  读取第一幅图像
[Row, Col] = size(Image); %  得到图像的行,列数

% r01=400;  r02=403; r03=400; r04=403;
r1=1;   r11=768; r2=1;  r22=1024;                       %  截图大小
h=30;j=150;                                               %  取点
single1=r11-r1+1;single2=r22-r2+1;   %截图的边长
 
% Im = zeros(single1,single2);          %  生成一个截图大小的零值矩阵，以便图像求和


ImageSump = zeros(single1,single2);   %  生成一个截图大小的零值矩阵，以便图像求和


ImageSumpp = zeros(1, 1);
% ImageSumpp0 = zeros(1, 1);
% Im01=zeros(r02-r01,r04-r03);
Im2=zeros(r11-r1+1,r22-r2+1);

Colg2 = zeros(single1,single2);  %  g2的存储矩阵，用于计算涨落的关联
ColG2 = zeros(single1,single2);  %  G2的存储矩阵，用于计算关联
% Colg02 = zeros(single1,single2);  %  g2的存储矩阵，用于计算涨落的关联
% ColG02 = zeros(single1,single2);  %  G2的存储矩阵，用于计算关联

 
tic

for I = 1 : Num    %  循环将NUM幅图像累加 
    ImageI= 999+I; %图片标号，用于读取
    FileName1 =[int2str(ImageI), '.bmp'];    %  形成文件名称，如Image1.jpg
    FileName2 =[int2str(ImageI), '.bmp'];   
    Image1 = double(rgb2gray(imread([Dir1 FileName1],'bmp'))); %imread([Dir1 FileName1], 'jpeg');先生成文件名称，为了读取图像 
    Image2 = double(rgb2gray(imread([Dir2 FileName2],'bmp'))); %imread([Dir2 FileName2], 'jpeg');先生成文件名称，为了读取图像。不同路径读取图像 

    Im2 =  Image2(r1:r11,r2:r22);   %引Image2中的矩阵作为Im2
%     Im01=  Image1(r01:r02-1,r03:r04-1);  %矩阵
    Im1= Image1(h,j);  %一个点
%     Im02 =  sum((sum(Im01))');
    ImageSump= ImageSump + double(Im2);   %Im2的NUM张图像求和
    ImageSumpp = ImageSumpp + double(Im1); %Im1的NUM张图像求和
%     ImageSumpp0 = ImageSumpp0 + double(Im02); %Im02的NUM张图像求和
 
%     I2 = ImageSumpp; %Im1图像求和作为平均亮度
    ColG2 = ColG2 + Im1.*double(Im2); %1、2图片做关联运算
%     ColG02 = ColG02 + Im02.*double(Im2);
     if mod(I,10)==0  %mod取模运算，结果与除数同号
        I/Num 
   toc  %tic toc 用于显示时间
     end  %显示已计算的进度和时间
end    
ImageAvep = ImageSump./Num; %  求得Im2的平均图像
ImageAvepp = ImageSumpp./Num; %  求得Im1的平均图像

Colg2 =(ColG2./Num)./(ImageAvep.*ImageAvepp);  %去掉系数的关联图像g2

Colg2nor = Colg2./max(max(Colg2));  %关联归一化图像

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