%使用计算机生成的散斑图样作为参考探测器测量值
clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片

%o=imread('C:\Users\123456\Desktop\lena256.jpg');
o=imread('C:\Users\Administrator\Desktop\20150623\仿真图片\a256.bmp');
% o=rgb2gray(o);
% o=zeros(256);%产生双缝
% o(:,70:100)=1;
% o(:,150:180)=1;
% b=ones(2)

num =1000;  %图片文件数
num1=50000;
num2=20000;
num3=35000;

%  num1=6500;

h=256;j=256;
 
ImageSum1 = 0;                       %  用于计算<R>  
ImageSum2 = 0;                        %  用于计算<S>  
ImageSum22 = zeros(h,j);  %  用于计算<I2(x2)>
g= zeros(h,j);
G= zeros(h,j);
ImageAvep1 = zeros(h,j);
ImageAvep2 = zeros(h,j);
ImageAvep22 = zeros(h,j);
 
Image1Sum1 = 0;                       %  用于计算<R>  
Image1Sum2 = 0;                        %  用于计算<S>  
Image1Sum22 = zeros(h,j);  %  用于计算<I2(x2)>
g1= zeros(h,j);
G1= zeros(h,j);
Image1Avep1 = zeros(h,j);
Image1Avep2 = zeros(h,j);
Image1Avep22 = zeros(h,j);
 
Image2Sum1 = 0;                       %  用于计算<R>  
Image2Sum2 = 0;                        %  用于计算<S>  
Image2Sum22 = zeros(h,j);  %  用于计算<I2(x2)>
g2= zeros(h,j);
G2= zeros(h,j);
Image2Avep1 = zeros(h,j);
Image2Avep2 = zeros(h,j);
Image2Avep22 = zeros(h,j);
 
Image3Sum1 = 0;                       %  用于计算<R>  
Image3Sum2 = 0;                        %  用于计算<S>  
Image3Sum22 = zeros(h,j);  %  用于计算<I2(x2)>
g3= zeros(h,j);
G3= zeros(h,j);
Image3Avep1 = zeros(h,j);
Image3Avep2 = zeros(h,j);
Image3Avep22 = zeros(h,j);

 Dir1= 'E:\随机图片\哈达玛\随机\';    %  文件夹路径
%  Dir1= 'E:\仿真\哈达玛\641\';    %  文件夹路径
tic
for I = 1 : num    %  循环将NUM幅图像累加 
    ImageI=I; %图片标号，用于读取
    FileName1 =['1_1_',int2str(ImageI), '.bmp'];    %  形成文件名称，如Image1.jpg  
    %Image1 = imread([Dir1 FileName1],'bmp');%参考探测器光场分布
%     a=imread([Dir1 FileName1],'jpg');%参考探测器光场分布
%     Image1=imerode(a,b);%加入腐蚀
    Image1=imread([Dir1 FileName1],'bmp');%参考探测器光场分布
    Image2 = double(Image1).*double(o);%桶探测器光场分布,处理灰度图像时注意最后的输出类型
    
    Ima=sum(sum(Image2));          %桶探测器总光强S
    Imb=sum(sum(Image1));          %参考探测器总光强R
   
    ImageSum1 = ImageSum1 + double(Ima);      %S总光强
    ImageSum2 = ImageSum2 + double(Imb);      %R总光强
    ImageSum22 = ImageSum22 + double(Image1);     %计算I2(x2)
    
    G = G + Ima.*double(Image1);              %关联计算S*I2(x2)
    g  = g + Imb.*double(Image1);                %计算R*I2(x2)
    
    ImageAvep1 = ImageSum1./num;         %计算S的平均值
    ImageAvep2 = ImageSum2./num;         %计算R的平均值 
    ImageAvep22 = ImageSum22./num;        %计算R的平均图像

    if mod(I,10)==0  %mod取模运算，结果与除数同号
    I/num 
    toc  %tic toc 用于显示时间
    end  %显示已计算的进度和时间   
    
    if I==num1;
        
        Image1Sum1 = ImageSum1;
        Image1Sum2 = ImageSum2;
        Image1Sum22 = ImageSum22;
        
        G1 = G;
        g1 = g;
      
        Image1Avep1 = Image1Sum1./num1;         %计算S的平均值
        Image1Avep2 = Image1Sum2./num1;         %计算R的平均值 
        Image1Avep22 = Image1Sum22./num1;        %计算R的平均图像
    
        Gt1 = G1./num1;                             %传统鬼成像 
        Gf1 = G1./num1 - Image1Avep1.*Image1Avep22;    %涨落关联图像
        Gd1 = G1./num1 - Image1Avep1./Image1Avep2 .* g1./num1; %差分鬼成像
%         figure;
%         imshow(Gt1)   
%         figure;
%         imshow(Gf1)
%         figure;
%         imshow(Gd1)

%         CGt1=uint8(round(255 * ((Gt1-min(min(Gt1)))./(max(max(Gt1))-min(min(Gt1))))));
%         CGf1=uint8(round(255 * ((Gf1-min(min(Gf1)))./(max(max(Gf1))-min(min(Gf1))))));
        CGd1=uint8(round(255 * ((Gd1-min(min(Gd1)))./(max(max(Gd1))-min(min(Gd1))))));

%         figure;
%         imshow(CGt1)
%         figure;
%         imshow(CGf1)
        figure;
        imshow(CGd1)
        imwrite(CGd1,'C:\Users\Administrator\Desktop\500.bmp');
           
    end
    
    if I==num2;
        
        Image2Sum1 = ImageSum1;
        Image2Sum2 = ImageSum2;
        Image2Sum22 = ImageSum22;
        
        G2 = G;
        g2 = g;
      
        Image2Avep1 = Image2Sum1./num2;         %计算S的平均值
        Image2Avep2 = Image2Sum2./num2;         %计算R的平均值 
        Image2Avep22 = Image2Sum22./num2;        %计算R的平均图像
    
        Gt2 = G2./num2;                             %传统鬼成像 
        Gf2 = G2./num2 - Image2Avep1.*Image2Avep22;    %涨落关联图像
        Gd2 = G2./num2 - Image2Avep1./Image2Avep2 .* g2./num2; %差分鬼成像
%         figure;
%         imshow(Gt2)   
%         figure;
%          imshow(Gf2)
%         figure;
%         imshow(Gd2)

%         CGt2=uint8(round(255 * ((Gt2-min(min(Gt2)))./(max(max(Gt2))-min(min(Gt2))))));
%         CGf2=uint8(round(255 * ((Gf2-min(min(Gf2)))./(max(max(Gf2))-min(min(Gf2))))));
         CGd2=uint8(round(255 * ((Gd2-min(min(Gd2)))./(max(max(Gd2))-min(min(Gd2))))));

%         figure;
%         imshow(CGt2)
%         figure;
%         imshow(CGf2)
        figure;
        imshow(CGd2)    
        imwrite(CGd2,'C:\Users\Administrator\Desktop\2000.bmp');
    end
    
    if I==num3;
        
        Image3Sum1 = ImageSum1;
        Image3Sum2 = ImageSum2;
        Image3Sum22 = ImageSum22;
        
        G3 = G;
        g3 = g;
      
        Image3Avep1 = Image3Sum1./num3;         %计算S的平均值
        Image3Avep2 = Image3Sum2./num3;         %计算R的平均值 
        Image3Avep22 = Image3Sum22./num3;        %计算R的平均图像
    
        Gt3 = G3./num3;                             %传统鬼成像 
        Gf3 = G3./num3 - Image3Avep1.*Image3Avep22;    %涨落关联图像
        Gd3 = G3./num3 - Image3Avep1./Image3Avep2 .* g3./num3; %差分鬼成像
%         figure;
%         imshow(Gt3)   
%         figure;
%         imshow(Gf3)
%         figure;
%         imshow(Gd3)

%         CGt3=uint8(round(255 * ((Gt3-min(min(Gt3)))./(max(max(Gt3))-min(min(Gt3))))));
%         CGf3=uint8(round(255 * ((Gf3-min(min(Gf3)))./(max(max(Gf3))-min(min(Gf3))))));
         CGd3=uint8(round(255 * ((Gd3-min(min(Gd3)))./(max(max(Gd3))-min(min(Gd3))))));

%         figure;
%         imshow(CGt3)
%         figure;
%         imshow(CGf3)
        figure;
        imshow(CGd3)    
        imwrite(CGd3,'C:\Users\Administrator\Desktop\3500.bmp');
    end
end

% Gt = G./num;                             %传统鬼成像
% Gg = G./num./(ImageAvep1.*ImageAvep22); %归一化鬼成像
% Gf = G./num - ImageAvep1.*ImageAvep22;    %涨落关联图像
Gd = G./num - ImageAvep1./ImageAvep2 .* g./num; %差分鬼成像


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
imwrite(CGd,'C:\Users\Administrator\Desktop\1000.bmp');
