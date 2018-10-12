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

clear all;    %  清除变量
clc;          %  清除屏幕
close all;    %  关闭图片


Num = 2000;                  %  图片文件数
single1=200; single2=200;    %  定义计算的图像大小
h=100; j=100;                %  桶探测器取点

ImageSump = zeros(single1,single2);   %  生成一个截图大小的零值矩阵，以便图像求和
ImageSumpp = 0;

Colg2 = zeros(single1,single2);  %  g2的存储矩阵，用于计算涨落的关联
ColG2 = zeros(single1,single2);  %  G2的存储矩阵，用于计算关联
 
tic

for I = 1 : Num    %  循环将NUM幅图像累加 
    ImageI=999+I;  %  图片标号，用于读取
    
    Image1 = 255 .* rand(single1,single2); 
    noise  = rand(single1,single2).*5;      %噪声
    Image2 = Image1;                        %可加入噪声

    Im1=  Image1(h,j);
    ImageSump= ImageSump + double(Image2);   %Im2的NUM张图像求和
    ImageSumpp = ImageSumpp + double(Im1); %Im1的NUM张图像求和
 
    ColG2 = ColG2 + Im1.*double(Image2); %1、2图片做关联运算
     if mod(I,10)==0  %mod取模运算，结果与除数同号
        I/Num 
   toc  %tic toc 用于显示时间
     end  %显示已计算的进度和时间
end    
ImageAvep = ImageSump./Num; %  求得Image2的平均图像
ImageAvepp = ImageSumpp./Num; %  求得Im1的平均图像

Colg2 =(ColG2./Num)./(ImageAvep.*ImageAvepp);   %去掉系数的关联图像g2
Colg2nor = Colg2/max(max(Colg2));               %关联归一化图像
Colg2flu =Colg2-1; %涨落关联图像
figure;
imshow(Colg2,[]);title('HBT');
figure;
imshow(Colg2nor,[]);title('HBT归一化');
figure;
imshow(Colg2flu,[]);title('HBT涨落');

figure;
plot(Colg2(1:single1,100:100));