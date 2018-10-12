
%使用DMD搭建计算鬼成像光路，进行HBT实验
clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片

num1 =500;
num2 =1000;
num =2000;  %图片文件数

m=1024;
n=768;

h=1024;
j=768;
g= zeros(h,j);
g1= zeros(h,j);
g2= zeros(h,j);
G= zeros(h,j);
G1= zeros(h,j);
G2= zeros(h,j);

Dir1= 'G:\image_save\反射\103001\r\';    %  文件夹路径
fid2=fopen('C:\Documents and Settings\Administrator\Desktop\full.dat','r');
tic
for I = 5: num    %  循环将NUM幅图像累加 
    FileName1=['1_1_',int2str(I), '.bmp'];    %  形成文件名称，如Image1.jpg 
    Image1 = imread([Dir1 FileName1],'bmp');%参考探测器光场分布
    Im1=sum(sum(Image1(689,549)));
    
    status=fseek(fid2,(I-1)*m*n+1,'bof');
    o=fread(fid2,[m,n],'uint8');
     O=o;
    g=g+double(Im1).*O;
    
    if mod(I,10)==0  %mod取模运算，结果与除数同号
    I/num
    toc  %tic toc 用于显示时间
    end  %显示已计算的进度和时间
    
    
    
    if I == num1   %  循环将NUM幅图像累加    
    g1=g;
    G1=g1./num1;
    CG1=uint8(round(255 * ((G1-min(min(G1)))./(max(max(G1))-min(min(G1))))));
    figure;
    imshow(CG1)
    end

    if I ==  num2   %  循环将NUM幅图像累加
    g2=g;
    G2=g2./num2;
    CG2=uint8(round(255 * ((G2-min(min(G2)))./(max(max(G2))-min(min(G2))))));
    figure;
    imshow(CG2)
    end

end

G=g./num;
CG=uint8(round(255 * ((G-min(min(G)))./(max(max(G))-min(min(G))))));
figure;
imshow(CG)

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
