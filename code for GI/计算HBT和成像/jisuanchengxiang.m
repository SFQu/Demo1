%计算鬼成像光路，对应成像
clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片

num1 =500;
num2 =1000;
num =2000;  %图片文件数

h=1024;
j=768;
i1=0;
i2=0;
S=0;
ImageSum1 = 0;                       %  用于计算<R>  
ImageSum2 = 0;                        %  用于计算<S>  
ImageSum22 = zeros(h,j);  %  用于计算<I2(x2)>
g= zeros(h,j);
g1= zeros(h,j);
g2= zeros(h,j);
G= zeros(256,256);
G1= zeros(256,256);
G2= zeros(256,256);
ImageAvep1 = zeros(h,j);
ImageAvep2 = zeros(h,j);
ImageAvep22 = zeros(h,j);

Dir1= 'G:\image_save\20150509\';    %  文件夹路径
fid2=fopen('C:\Documents and Settings\Administrator\Desktop\2000_64_256.dat','r');
tic
for I = 5: num    %  循环将NUM幅图像累加 
    FileName1=['1_1_',int2str(I), '.bmp'];    %  形成文件名称，如Image1.jpg 
    Image1 = imread([Dir1 FileName1],'bmp');%参考探测器光场分布
   Im1=sum(sum(Image1(505:515,530:600)));
    
    status=fseek(fid2,(I-1)*h*j+1,'bof');
    o=fread(fid2,[h,j],'uint8');
     O=o(300:555,300:555);
    G=G+double(Im1).*O;

%     ImageSum1 = ImageSum1 + double(Ima);      %S总光强
%     ImageAvep1 = ImageSum1./num;         %计算S的平均值
%  
%     ImageSum22 = ImageSum22 + double(Image1);      %<I2(x2)>分布，相当于背景噪声
%     ImageAvep22 = ImageSum22./num;         %计算<I2(x2)>的平均值
    
    if mod(I,10)==0  %mod取模运算，结果与除数同号
    I/num 
    toc  %tic toc 用于显示时间
    end  %显示已计算的进度和时间
    
   if I == num1   %  循环将NUM幅图像累加 

    G1=G;

%     ImageSum1 = ImageSum1 + double(Ima);      %S总光强
%     ImageAvep1 = ImageSum1./num;         %计算S的平均值
%  
%     ImageSum22 = ImageSum22 + double(Image1);      %<I2(x2)>分布，相当于背景噪声
%     ImageAvep22 = ImageSum22./num;         %计算<I2(x2)>的平均值
    
    
    CG1=uint8(round(255 * ((G1-min(min(G1)))./(max(max(G1))-min(min(G1))))));
figure;
imshow(CG1)

end

if I ==  num2   %  循环将NUM幅图像累加 

    G2=G;

%     ImageSum1 = ImageSum1 + double(Ima);      %S总光强
%     ImageAvep1 = ImageSum1./num;         %计算S的平均值
%  
%     ImageSum22 = ImageSum22 + double(Image1);      %<I2(x2)>分布，相当于背景噪声
%     ImageAvep22 = ImageSum22./num;         %计算<I2(x2)>的平均值
    
    CG2=uint8(round(255 * ((G2-min(min(G2)))./(max(max(G2))-min(min(G2))))));
figure;
imshow(CG2)


end

end

CG=uint8(round(255 * ((G-min(min(G)))./(max(max(G))-min(min(G))))));
figure;
imshow(CG)





% for I = 1 : num    %  循环将NUM幅图像累加 
%     ImageI=I; %图片标号，用于读取
%     FileName1 =[int2str(ImageI), '.bmp'];    %  形成文件名称，如Image1.jpg  
%     Image1 = imread([Dir1 FileName1],'bmp');%参考探测器光场分布
%     Image2 = Image1.*o;
%     
%     Ima=sum(sum(Image2));          %桶探测器总光强S
%     S=Ima-ImageAvep1;
%     
%   if S>0
%       i1=i1+1;
%       g1=g1+double(Image1);
%   else if S<0
%           i2=i2+1;
%           g2=g2+double(Image1);   
%       end
%   end
% 
%     if mod(I,10)==0  %mod取模运算，结果与除数同号
%     I/num 
%     toc  %tic toc 用于显示时间
%     end  %显示已计算的进度和时间   
%     
% end

% G1=g1/i1;%对应正像
% G2=g2/i2;%对应负像
% G3=g1/i1-ImageAvep22;%对应正像减去背景噪声
% G4=g2/i2-ImageAvep22;%对应负像减去背景噪声
% G5=G1-G2;%对应正像减去负像
% CG1=uint8(round(255 * ((G1-min(min(G1)))./(max(max(G1))-min(min(G1))))));
% CG2=uint8(round(255 * ((G2-min(min(G2)))./(max(max(G2))-min(min(G2))))));
% CG3=uint8(round(255 * ((G3-min(min(G3)))./(max(max(G3))-min(min(G3))))));
% CG4=uint8(round(255 * ((G4-min(min(G4)))./(max(max(G4))-min(min(G4))))));
% CG5=uint8(round(255 * ((G5-min(min(G5)))./(max(max(G5))-min(min(G5))))));
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
% figure;
% imshow(CG1);
% figure;
% imshow(CG2);
% figure;
% imshow(CG3);
% figure;
% imshow(CG4);
% figure;
% imshow(CG5);
 
% %峰值信噪比PSNR计算方法
% O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% sub1 = CG5-o; %用于存储像与原图的差
% MSE1 = sum(sum(sub1 .* sub1)')/(256*256);
% SNR1 = 10*log10(255*255/MSE1)

% % 时间对应差分关联成像
% % 使用计算机生成的散斑图样作为参考探测器测量值
% clear all;    %  清除变量
% clc;    %  清除屏幕
% close all;    %  关闭图片
% 
% %o=imread('C:\Users\123456\Desktop\lena256.jpg');
% o=imread('C:\Users\123456\Desktop\图\buaa1.bmp');
% num =5000;  %图片文件数
% num1=1000;
% num2=5000;
% num3=10000;
%  
% h=64;j=64;
% i1=0;
% i2=0;
% S=0;
% ImageSum1 = 0;                       %  用于计算<R>  
% ImageSum2 = 0;                        %  用于计算<S>  
% ImageSum22 = zeros(h,j);  %  用于计算<I2(x2)>
% g1= zeros(h,j);
% g2= zeros(h,j);
% G= zeros(h,j);
% ImageAvep1 = zeros(h,j);
% ImageAvep2 = zeros(h,j);
% ImageAvep22 = zeros(h,j);
% 
% Dir1= 'E:\仿真图片\DMD64\';    %  文件夹路径
% 
% tic
% for I = 1 : num    %  循环将NUM幅图像累加 
%     ImageI=I; %图片标号，用于读取
%     FileName1 =[int2str(ImageI), '.bmp'];    %  形成文件名称，如Image1.jpg  
%     Image1 = imread([Dir1 FileName1],'bmp');%参考探测器光场分布
%  
%     Image2 = Image1.*o;    %桶探测器光场分布
%     Ima=sum(sum(Image2));          %桶探测器总光强S
%     Imb=sum(sum(Image1));          %参考探测器总光强R
%    
%     ImageSum1 = ImageSum1 + double(Ima);      %S总光强
%     ImageSum2 = ImageSum2 + double(Imb);      %R总光强
%    
%     ImageAvep1 = ImageSum1./num;         %计算S的平均值
%     ImageAvep2 = ImageSum2./num;         %计算R的平均值 
% 
%     ImageSum22 = ImageSum22 + double(Image1);      %<I2(x2)>分布，相当于背景噪声
%     ImageAvep22 = ImageSum22./num;         %计算<I2(x2)>的平均值
% 
%     if mod(I,10)==0  %mod取模运算，结果与除数同号
%     I/num 
%     toc  %tic toc 用于显示时间
%     end  %显示已计算的进度和时间
%     
% end
% 
% for I = 1 : num    %  循环将NUM幅图像累加 
%     ImageI=I; %图片标号，用于读取
%     FileName1 =[int2str(ImageI), '.bmp'];    %  形成文件名称，如Image1.jpg  
%     Image1 = imread([Dir1 FileName1],'bmp');%参考探测器光场分布
%     Image2 = Image1.*o;
%     
%     Ima=sum(sum(Image2));          %桶探测器总光强S
%     Imb=sum(sum(Image1));          %参考探测器总光强R   
%     %S=Ima-ImageAvep1/ImageAvep2*Imb;% 时间对应差分关联成像
%     S=Ima./Imb-ImageAvep1/ImageAvep2;%双阈值时间对应成像桶探测器选择信号
%   if S>0
%       i1=i1+1;
%       g1=g1+double(Image1);   
%         else if S<0
%           i2=i2+1;
%           g2=g2+double(Image1);   
%             end
%   end
%   
%      if mod(I,10)==0  %mod取模运算，结果与除数同号
%     I/num 
%     toc  %tic toc 用于显示时间
%     end  %显示已计算的进度和时间    
% end
% 
% G1=g1/i1;%对应正像
% G2=g2/i2;%对应负像
% G3=g1/i1-ImageAvep22;%对应正像减去背景噪声
% G4=g2/i2-ImageAvep22;%对应负像减去背景噪声
% G5=G1-G2;%对应正像减去负像
% CG1=uint8(round(255 * ((G1-min(min(G1)))./(max(max(G1))-min(min(G1))))));
% CG2=uint8(round(255 * ((G2-min(min(G2)))./(max(max(G2))-min(min(G2))))));
% CG3=uint8(round(255 * ((G3-min(min(G3)))./(max(max(G3))-min(min(G3))))));
% CG4=uint8(round(255 * ((G4-min(min(G4)))./(max(max(G4))-min(min(G4))))));
% CG5=uint8(round(255 * ((G5-min(min(G5)))./(max(max(G5))-min(min(G5))))));
% % figure;
% % imshow(G1);
% % figure;
% % imshow(G2);
% % figure;
% % imshow(G3);
% % figure;
% % imshow(G4);
% % figure;
% % imshow(G5);
% figure;
% imshow(CG1);
% figure;
% imshow(CG2);
% figure;
% imshow(CG3);
% figure;
% imshow(CG4);
% figure;
% imshow(CG5);
% 
% % %下面计算信噪比
% % %李明飞师兄计算方法
% % O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% % Avehuidu = sum(sum(O))./(256*256);
% % sub1= O-Avehuidu;
% % sub2= CGd-O;
% % SNR1=sum(sum(sub1.*sub1))./sum(sum(sub2.*sub2))
