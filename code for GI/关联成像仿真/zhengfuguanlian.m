%正负关联成像
%使用计算机生成的散斑图样作为参考探测器测量值
clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片

%o=imread('C:\Users\123456\Desktop\lena256.bmp');
o=imread('C:\Users\123456\Desktop\图\buaa1.bmp');
%o=imread('C:\Users\123456\Desktop\doubleslit64.bmp');
num =10000;  %图片文件数
num1=1000;
num2=5000;
num3=10000;
 
h=64;j=64;
i1=0;
i2=0;
i3=0;
i4=0;
S=0;
ImageSum1 = 0;                       %  用于计算<R>  
ImageSum2 = 0;                        %  用于计算<S>  
ImageSum22 = zeros(h,j);  %  用于计算<I2(x2)>
g1= zeros(h,j);
g2= zeros(h,j);
g3= zeros(h,j);
g4= zeros(h,j);

ImageAvep1 = zeros(h,j);
ImageAvep2 = zeros(h,j);
ImageAvep22 = zeros(h,j);


Dir1= 'E:\仿真图片\DMD64\';    %  文件夹路径

tic
for I = 1 : num    %  循环将NUM幅图像累加 
    ImageI=I; %图片标号，用于读取
    FileName1 =[int2str(ImageI), '.bmp'];    %  形成文件名称，如Image1.jpg  
    Image1 = imread([Dir1 FileName1],'bmp');%参考探测器光场分布
        
    Image2 = Image1.*o;    %桶探测器光场分布
    Ima=sum(sum(Image2));          %桶探测器总光强S
    Imb=sum(sum(Image1));
    
    ImageSum2 = ImageSum2 + Ima;      %S总光强
    ImageAvep2 = ImageSum2./num;         %计算S的平均值
    
    ImageSum1 = ImageSum1 + Imb;      %R总光场分布
    ImageAvep1 = ImageSum1./num;    %计算R的平均值

    ImageSum22 = ImageSum22 + double(Image1);     %<I2(x2)>分布，相当于背景噪声
    ImageAvep22 = ImageSum22./num;         %计算<I2(x2)>的平均值
    
    if mod(I,10)==0  %mod取模运算，结果与除数同号
    I/num 
    toc  %tic toc 用于显示时间
    end  %显示已计算的进度和时间
    
end

for I = 1 : num    %  循环将NUM幅图像累加 
    ImageI=I; %图片标号，用于读取
    FileName1 =[int2str(ImageI), '.bmp'];    %  形成文件名称，如Image1.jpg  
    Image1 = imread([Dir1 FileName1],'bmp');%参考探测器光场分布
    Image2 = Image1.*o;
    
    Ima=sum(sum(Image2));
    Imb=sum(sum(Image1));
    S=Ima-ImageAvep2;
    %S=Ima-ImageAvep2/ImageAvep1*Imb;% 时间对应差分关联成像
    %S=Ima./Imb-ImageAvep2/ImageAvep1;%双阈值时间对应成像桶探测器选择信号
    R=Imb-ImageAvep1;
    
  if S>0&&R>0
      i1=i1+1;
      g1=g1+Ima.*double(Image1);
  end
  if S>0&&R<0
      i2=i2+1;
      g2=g2+Ima.*double(Image1);
  end
  if S<0&&R>0
      i3=i3+1;
      g3=g3+Ima.*double(Image1);              
  end
  if S<0&&R<0
      i4=i4+1;
      g4=g4+Ima.*double(Image1);  
  end

    if mod(I,10)==0  %mod取模运算，结果与除数同号
    I/num 
    toc  %tic toc 用于显示时间
    end  %显示已计算的进度和时间   
    
end

G1=g1/i1-ImageAvep22;
G2=g2/i2-ImageAvep22;
G3=g3/i3-ImageAvep22;
G4=g4/i4-ImageAvep22;
%G5=(g1-g2-g3+g4)/num;
CG1=uint8(round(255 * ((G1-min(min(G1)))./(max(max(G1))-min(min(G1))))));
CG2=uint8(round(255 * ((G2-min(min(G2)))./(max(max(G2))-min(min(G2))))));
CG3=uint8(round(255 * ((G3-min(min(G3)))./(max(max(G3))-min(min(G3))))));
CG4=uint8(round(255 * ((G4-min(min(G4)))./(max(max(G4))-min(min(G4))))));
CG5=CG1-CG2-CG3+CG4;
%CG5=uint8(round(255 * ((G4-min(min(G5)))./(max(max(G5))-min(min(G5))))));
% figure;
% imshow(G1);
% figure;
% imshow(G2);
% figure;
% imshow(G3);
% figure;
% imshow(G4);
% figure;
% imshow(G5);
figure;
imshow(CG1);
figure;
imshow(CG2);
figure;
imshow(CG3);
figure;
imshow(CG4);
figure;
imshow(CG5);
 
% %峰值信噪比PSNR计算方法
% O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% sub1 = CG5-o; %用于存储像与原图的差
% MSE1 = sum(sum(sub1 .* sub1)')/(256*256);
% SNR1 = 10*log10(255*255/MSE1)

% %下面计算信噪比
% %李明飞师兄计算方法
% O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% Avehuidu = sum(sum(O))./(256*256);
% sub1= O-Avehuidu;
% sub2= CGd-O;
% SNR1=sum(sum(sub1.*sub1))./sum(sum(sub2.*sub2))
