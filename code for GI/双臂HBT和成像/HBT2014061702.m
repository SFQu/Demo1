clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片


Dir1= 'C:\Users\Administrator\Desktop\2014.06.17.02\';    %  文件夹路径
Dir2= 'C:\Users\Administrator\Desktop\2014.06.17.02\';    %  文件夹路径
Directory1 = 'C:\Users\Administrator\Desktop\2014.06.17.02\1001.bmp';    %  第一幅图像的路径，以便测试图像大小
Num =1100;  %  图片文件数


Image = imread(Directory1, 'bmp');    %  读取第一幅图像
[Row, Col] = size(Image); %  得到图像的行,列数


r1=393;   r11=867; r2=1062;  r22=1596;                       %  截图大小
h=480;j=846;                                               %  取点
single1=r11-r1+1;single2=r22-r2+1;   %截图的边长
 



ImageSump = zeros(single1,single2);   %  生成一个截图大小的零值矩阵，以便图像求和


ImageSumpp = zeros(1, 1);

Im2=zeros(r11-r1+1,r22-r2+1);

Colg2 = zeros(single1,single2);  %  g2的存储矩阵，用于计算涨落的关联
ColG2 = zeros(single1,single2);  %  G2的存储矩阵，用于计算关联


 
tic

for I = 1 : Num    %  循环将NUM幅图像累加 
    ImageI= 1000+I; %图片标号，用于读取
    FileName1 =[int2str(ImageI), '.bmp'];    %  形成文件名称，如Image1.jpg
    FileName2 =[int2str(ImageI), '.bmp'];   
 
    Image1 = double(imread([Dir1 FileName1],'bmp')); 
    Image2 = double(imread([Dir2 FileName2],'bmp')); 

    Im2 =  Image2(r1:r11,r2:r22);   %引Image2中的矩阵作为Im2

    Im1= Image1(h,j);  %一个点

    ImageSump= ImageSump + double(Im2);   %Im2的NUM张图像求和
    ImageSumpp = ImageSumpp + double(Im1); %Im1的NUM张图像求和

    ColG2 = ColG2 + Im1.*double(Im2); %1、2图片做关联运算

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