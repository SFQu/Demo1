%计算鬼成像光路，对应成像
clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片

num1 =10;
num2 =1000;
num =2000;  %图片文件数

m=1024;
n=768;

% h=256;
% j=256;
h=151;
j=171;

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


Dir1= 'G:\image_save\反射\103001\s1\';    %  文件夹路径
Dir2= 'G:\image_save\反射\103001\r\';
% fid2=fopen('C:\Documents and Settings\Administrator\Desktop\2000_64_256.dat','r');
fid2=fopen('C:\Documents and Settings\Administrator\Desktop\full.dat','r');
tic
for I = 1: num    %  循环将NUM幅图像累加 
    
    FileName1=['1_1_',int2str(I), '.bmp'];%桶探测器测量值
    Im1 = imread([Dir1 FileName1],'bmp');
    Image1=Im1(730:830,700:800);
%   Image1=Im1;
    Ima=sum(sum(Image1));
    

 
%   fid1=['C:\Documents and Settings\Administrator\Desktop\S2.txt','.txt'];
%     c=fopen(fid1,'a');
%     fprintf(c,'%f\n',Ima);
%      fclose(c);
    
    status=fseek(fid2,(I-1)*m*n+1,'bof');%参考探测器读取值
    o=fread(fid2,[m,n],'uint8');
    Image2=o(400:900,300:750);
%     FileName2=['1_1_',int2str(I), '.bmp'];%参考探测器测量值
%     Im2 = imread([Dir2 FileName1],'bmp');
%     Image2=Im2(700:850,680:850);

    Imb=sum(sum(Image2));
    
    ImageSum1 = ImageSum1 + double(Ima);      %S总光强
    ImageSum2 = ImageSum2 + double(Imb);      %R总光强
    ImageSum22 = ImageSum22 + double(Image2);     %计算I2(x2)
   
    G = G + Ima.*double(Image2);              %关联计算S*I2(x2)
    g = g + Imb.*double(Image2);              %计算R*I2(x2)
    
    ImageAvep1 = ImageSum1./num;         %计算S的平均值
    ImageAvep2 = ImageSum2./num;         %计算R的平均值 
    ImageAvep22 = ImageSum22./num;        %计算R的平均图像
     
    if mod(I,10)==0  %mod取模运算，结果与除数同号
    I/num 
    toc  %tic toc 用于显示时间
    end  %显示已计算的进度和时间
    
%    if I == num1   %  循环将NUM幅图像累加 
% 
%         Image1Sum1 = ImageSum1;
%         Image1Sum2 = ImageSum2;
%         Image1Sum22 = ImageSum22;
%         
%         G1 = G;
%         g1 = g;
%       
%         Image1Avep1 = Image1Sum1./num1;         %计算S的平均值
%         Image1Avep2 = Image1Sum2./num1;         %计算R的平均值 
%         Image1Avep22 = Image1Sum22./num1;        %计算R的平均图像
%     
%         Gt1 = G1./num1;                             %传统鬼成像 
%         Gf1 = G1./num1 - Image1Avep1.*Image1Avep22;    %涨落关联图像
%         Gd1 = G1./num1 - Image1Avep1./Image1Avep2 .* g1./num1; %差分鬼成像
%         
% %         figure;
% %         imshow(Gt1)   
% %         figure;
% %         imshow(Gf1)
% %         figure;
% %         imshow(Gd1)
% 
%         CGt1=uint8(round(255 * ((Gt1-min(min(Gt1)'))./(max(max(Gt1)')-min(min(Gt1)')))));
%         CGf1=uint8(round(255 * ((Gf1-min(min(Gf1)'))./(max(max(Gf1)')-min(min(Gf1)')))));
%         CGd1=uint8(round(255 * ((Gd1-min(min(Gd1)'))./(max(max(Gd1)')-min(min(Gd1)')))));
%         figure;
%         imshow(CGt1)
%         figure;
%         imshow(CGf1)
%         figure;
%         imshow(CGd1)
%    end
% 
%     if I ==  num2   %  循环将NUM幅图像累加 
% 
%         Image1Sum1 = ImageSum1;
%         Image1Sum2 = ImageSum2;
%         Image1Sum22 = ImageSum22;
%         
%         G1 = G;
%         g1 = g;
%       
%         Image1Avep1 = Image1Sum1./num1;         %计算S的平均值
%         Image1Avep2 = Image1Sum2./num1;         %计算R的平均值 
%         Image1Avep22 = Image1Sum22./num1;        %计算R的平均图像
%     
%         Gt1 = G1./num1;                             %传统鬼成像 
%         Gf1 = G1./num1 - Image1Avep1.*Image1Avep22;    %涨落关联图像
%         Gd1 = G1./num1 - Image1Avep1./Image1Avep2 .* g1./num1; %差分鬼成像
% %         figure;
% %         imshow(Gt1)   
% %         figure;
% %         imshow(Gf1)
% %         figure;
% %         imshow(Gd1)
% 
%         CGt1=uint8(round(255 * ((Gt1-min(min(Gt1)'))./(max(max(Gt1)')-min(min(Gt1)')))));
%         CGf1=uint8(round(255 * ((Gf1-min(min(Gf1)'))./(max(max(Gf1)')-min(min(Gf1)')))));
%         CGd1=uint8(round(255 * ((Gd1-min(min(Gd1)'))./(max(max(Gd1)')-min(min(Gd1)')))));
%         figure;
%         imshow(CGt1)
%         figure;
%         imshow(CGf1)
%         figure;
%         imshow(CGd1)
%     end

end

Gt = G./num;                             %传统鬼成像 
Gf = G./num - ImageAvep1.*ImageAvep22;    %涨落关联图像
Gd = G./num - ImageAvep1./ImageAvep2 .* g./num; %差分鬼成像
% figure;
% imshow(Gt)   
% figure;
% imshow(Gf)
% figure;
% imshow(Gd)

CGt=uint8(round(255 * ((Gt-min(min(Gt)))./(max(max(Gt))-min(min(Gt))))));
CGf=uint8(round(255 * ((Gf-min(min(Gf)))./(max(max(Gf))-min(min(Gf))))));
CGd=uint8(round(255 * ((Gd-min(min(Gd)))./(max(max(Gd))-min(min(Gd))))));
figure;
imshow(CGt)
figure;
imshow(CGf)
figure;
imshow(CGd)


% %峰值信噪比PSNR计算方法
% O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% sub1 = CG5-o; %用于存储像与原图的差
% MSE1 = sum(sum(sub1 .* sub1)')/(256*256);
% SNR1 = 10*log10(255*255/MSE1)

% % %下面计算信噪比
% % %李明飞师兄计算方法
% % O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% % Avehuidu = sum(sum(O))./(256*256);
% % sub1= O-Avehuidu;
% % sub2= CGd-O;
% % SNR1=sum(sum(sub1.*sub1))./sum(sum(sub2.*sub2))
