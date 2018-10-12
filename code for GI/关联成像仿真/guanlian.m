clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片


Dir1= 'E:\实验\实验数据\双光臂热光关联成像\1\1\';    %  文件夹路径
Dir2= 'E:\实验\实验数据\双光臂热光关联成像\1\2\';    %  文件夹路径
Num1 = 5000;  %  图片文件数
Num2 = 10000;
Num3 = 20000;
Num = 5000;

single1=270;single2=270;                      %  目测物的大小
x1=358; y1=445; x2=366; y2=364;               %  具有关联的点,1(y1,x1),2(y2,x2)
a0=216; b0=327;                               %  桶探测器截图起点(b0,a0)
c0=x2-x1+a0; d0=y2+y1-b0;                     %  参考探测器截图起点
a=a0+1; b=a0+single1; c=b0+1; d=b0+single2;   %  设定Image1的截图范围
a1=c0+1;b1=c0+single1;c1=d0-single2;d1=d0-1;  %  设定Image2的截图范围

Image01 =  zeros(single1,single2);
% Image02 =  zeros(single1,single2);
Image1  =  zeros(single1,single2);
Image2  =  zeros(single1,single2);


ImageSump1 = 0;                       %  用于计算<I1>  即S
ImageSump22=0;                        %  用于计算<I2>  即R
ImageSump2 = zeros(single1,single2);  %  用于计算<I2(x2)>

ColG2 = zeros(single1,single2);  %  G2的存储矩阵，用于计算成像
Colg2 = zeros(single1,single2);  %  g2的存储矩阵，用于计算去掉背景的成像
Col = zeros(single1,single2);    %  G2的存储矩阵，用于计算差分成像

Image1Sump1 = 0;                       %  用于计算<I1>  即S
Image1Sump22=0;                        %  用于计算<I2>  即R
Image1Sump2 = zeros(single1,single2);  %  用于计算<I2(x2)>

Col1G2 = zeros(single1,single2);  %  G2的存储矩阵，用于计算成像
Col1g2 = zeros(single1,single2);  %  g2的存储矩阵，用于计算去掉背景的成像
Col1 = zeros(single1,single2);    %  G2的存储矩阵，用于计算差分成像

Image2Sump1 = 0;                       %  用于计算<I1>  即S
Image2Sump22=0;                        %  用于计算<I2>  即R
Image2Sump2 = zeros(single1,single2);  %  用于计算<I2(x2)>

Col2G2 = zeros(single1,single2);  %  G2的存储矩阵，用于计算成像
Col2g2 = zeros(single1,single2);  %  g2的存储矩阵，用于计算去掉背景的成像
Col2 = zeros(single1,single2);    %  G2的存储矩阵，用于计算差分成像

Image3Sump1 = 0;                       %  用于计算<I1>  即S
Image3Sump22=0;                        %  用于计算<I2>  即R
Image3Sump2 = zeros(single1,single2);  %  用于计算<I2(x2)>

Col3G2 = zeros(single1,single2);  %  G2的存储矩阵，用于计算成像
Col3g2 = zeros(single1,single2);  %  g2的存储矩阵，用于计算去掉背景的成像
Col3 = zeros(single1,single2);    %  G2的存储矩阵，用于计算差分成像

tic

for I = 1 : Num    %  循环将NUM幅图像累加 
    ImageI=999+I; %图片标号，用于读取
    FileName1 =[int2str(ImageI), '.jpeg'];    %  形成文件名称，如Image1.jpg
    FileName2 =[int2str(ImageI), '.jpeg'];   
    Image001 = imread([Dir1 FileName1],'jpeg');
    Image002 = imread([Dir2 FileName2],'jpeg');
    Image1  =  Image001(a:b,c:d);
    Image2   =  Image002(a1:b1,c1:d1);
    
    Ima=sum(sum(Image1)');           %桶探测器S
    Imb=sum(sum(Image2)');           %桶探测器R

    ImageSump1 = ImageSump1 + double(Ima);      %S总光强
    ImageSump2 = ImageSump2 + double(Image2);     %计算I2(x2)
    ImageSump22 = ImageSump22 + double(Imb);      %R总光强
    %以上先求出所有图片的相关值，再进行关联运算

    ColG2 = ColG2 + Ima .* double(Image2);              %关联计算S*I2(x2)
    Col   = Col + Imb .* double(Image2);                %计算R*I2(x2)
    
     if mod(I,10)==0  %mod取模运算，结果与除数同号
        I/Num 
        toc  %tic toc 用于显示时间
     end  %显示已计算的进度和时间
     
     if I==Num1
         Image1Sump1 = ImageSump1;
         Image1Sump2 = ImageSump2;
         Image1Sump22 = ImageSump22;
         Col1G2 = ColG2;
         Col1   = Col;
         
         Image1Avep1 = Image1Sump1./Num1;  %  求得S的平均图像
         Image1Avep2 = Image1Sump2./Num1;  %  求得R的平均图像
         Image1Avep22= Image1Sump22./Num1; %  求得R*I2(x2)的平均图像
         
         Col1g2 = Col1G2./Num1-Image1Avep1.*Image1Avep2;    %涨落关联图像
         Col1d2 = Col1G2./Num1- Image1Avep1./Image1Avep22 .* Col1./Num1; %差分鬼成像
         
         ColG2nor1=uint8(round(255 * ((Col1G2-min(min(Col1G2)'))./(max(max(Col1G2)')-min(min(Col1G2)')))));
         Colg2nor1=uint8(round(255 * ((Col1g2-min(min(Col1g2)'))./(max(max(Col1g2)')-min(min(Col1g2)')))));
         Cold2nor1=uint8(round(255 * ((Col1d2-min(min(Col1d2)'))./(max(max(Col1d2)')-min(min(Col1d2)')))));

         figure;
         imshow(ColG2nor1,[]);title('Image');
%          imwrite(ColG2nor1,'J:\HBT\GI\20140324\0\GI\Image5000.bmp','bmp');
         figure;
         imshow(Colg2nor1,[]);title('Image-flu');
        % imwrite(Colg2nor1,'J:\HBT\GI\20140324\0\GI\Image-flu5000.bmp','bmp');
         figure;
         imshow(Cold2nor1,[]);title('Image-dif');
        % imwrite(Cold2nor1,'J:\HBT\GI\20140324\0\GI\Image-dif5000.bmp','bmp');
     end
     
     if I==Num2
         Image2Sump1 = ImageSump1;
         Image2Sump2 = ImageSump2;
         Image2Sump22 = ImageSump22;
         Col2G2 = ColG2;
         Col2   = Col;
         
         Image2Avep1 = Image2Sump1./Num2;  %  求得S的平均图像
         Image2Avep2 = Image2Sump2./Num2;  %  求得R的平均图像
         Image2Avep22= Image2Sump22./Num2; %  求得R*I2(x2)的平均图像
         
         Col2g2 = Col2G2./Num2-Image2Avep1.*Image2Avep2;    %涨落关联图像
         Col2d2 = Col2G2./Num2- Image2Avep1./Image2Avep22 .* Col2./Num2; %差分鬼成像
         
         ColG2nor2=uint8(round(255 * ((Col2G2-min(min(Col2G2)'))./(max(max(Col2G2)')-min(min(Col2G2)')))));
         Colg2nor2=uint8(round(255 * ((Col2g2-min(min(Col2g2)'))./(max(max(Col2g2)')-min(min(Col2g2)')))));
         Cold2nor2=uint8(round(255 * ((Col2d2-min(min(Col2d2)'))./(max(max(Col2d2)')-min(min(Col2d2)')))));

         figure;
         imshow(ColG2nor2,[]);title('Image');
         %imwrite(ColG2nor2,'J:\HBT\GI\20140324\0\GI\Image10000.bmp','bmp');
         figure;
         imshow(Colg2nor2,[]);title('Image-flu');
         %imwrite(Colg2nor2,'J:\HBT\GI\20140324\0\GI\Image-flu10000.bmp','bmp');
         figure;
         imshow(Cold2nor2,[]);title('Image-dif');
         %imwrite(Cold2nor2,'J:\HBT\GI\20140324\0\GI\Image-dif10000.bmp','bmp');
     end
     
     if I==Num3
         Image3Sump1 = ImageSump1;
         Image3Sump2 = ImageSump2;
         Image3Sump22 = ImageSump22;
         Col3G2 = ColG2;
         Col3   = Col;
         
         Image3Avep1 = Image3Sump1./Num3;  %  求得S的平均图像
         Image3Avep2 = Image3Sump2./Num3;  %  求得R的平均图像
         Image3Avep22= Image3Sump22./Num3; %  求得R*I2(x2)的平均图像
         
         Col3g2 = Col3G2./Num3-Image3Avep1.*Image3Avep2;    %涨落关联图像
         Col3d2 = Col3G2./Num3- Image3Avep1./Image3Avep22 .* Col3./Num3; %差分鬼成像

         ColG2nor3=uint8(round(255 * ((Col3G2-min(min(Col3G2)'))./(max(max(Col3G2)')-min(min(Col3G2)')))));
         Colg2nor3=uint8(round(255 * ((Col3g2-min(min(Col3g2)'))./(max(max(Col3g2)')-min(min(Col3g2)')))));
         Cold2nor3=uint8(round(255 * ((Col3d2-min(min(Col3d2)'))./(max(max(Col3d2)')-min(min(Col3d2)')))));
         
         figure;
         imshow(ColG2nor3,[]);title('Image');
         %imwrite(ColG2nor3,'J:\HBT\GI\20140324\0\GI\Image20000.bmp','bmp');
         figure;
         imshow(Colg2nor3,[]);title('Image-flu');
         %imwrite(Colg2nor3,'J:\HBT\GI\20140324\0\GI\Image-flu20000.bmp','bmp');
         figure;
         imshow(Cold2nor3,[]);title('Image-dif');
        % imwrite(Cold2nor3,'J:\HBT\GI\20140324\0\GI\Image-dif20000.bmp','bmp');

     end
end   

ImageAvep1 = ImageSump1./Num;  %  求得S的平均图像
ImageAvep2 = ImageSump2./Num;  %  求得R的平均图像
ImageAvep22= ImageSump22./Num; %  求得R*I2(x2)的平均图像

Colg2 = ColG2./Num-ImageAvep1.*ImageAvep2;    %涨落关联图像
Cold2 = ColG2./Num- ImageAvep1./ImageAvep22 .* Col./Num; %差分鬼成像

ColG2nor=uint8(round(255 * ((ColG2-min(min(ColG2)'))./(max(max(ColG2)')-min(min(ColG2)')))));
Colg2nor=uint8(round(255 * ((Colg2-min(min(Colg2)'))./(max(max(Colg2)')-min(min(Colg2)')))));
Cold2nor=uint8(round(255 * ((Cold2-min(min(Cold2)'))./(max(max(Cold2)')-min(min(Cold2)')))));

% %下面计算信噪比
% sub1 = zeros(single1,single2);   %用于存储像与原图的差
% sub1 = double(ColG2nor)-Obj0;
% MSE1 = sum(sum(sub1 .* sub1)')/(single1*single2);
% SNR1 = 10*log(255*255/MSE1);
% 
% sub2 = zeros(single1,single2);   %用于存储像与原图的差
% sub2 = double(Colg2nor)-Obj0;
% MSE2 = sum(sum(sub2 .* sub2)')/(single1*single2);
% SNR2 = 10*log(255*255/MSE2);
% 
% sub3 = zeros(single1,single2);   %用于存储像与原图的差
% sub3 = double(Cold2nor)-Obj0;
% MSE3 = sum(sum(sub3 .* sub3)')/(single1*single2);
% SNR3 = 10*log(255*255/MSE3);

% %使用刘雪峰的方法
% T = zeros(single1,single2);   %用于计算透光部分
% NT= zeros(single1,single2);   %用于计算不透光部分
% %GI
% T = Obj.* double(ColG2nor);
% NT= (1-Obj).*double(ColG2nor);
% sumT=0;
% sumNT=0;
% 
% k1=0;
% for i=1:single1
%     for j=1:single2
%         if T(i,j)>0
%             sumT=sumT+T(i,j);
%             k1=k1+1;
%         end
%     end
% end
% averT=sumT/k1;
% 
% k2=0;
% for i=1:single1
%     for j=1:single2
%         if NT(i,j)>0
%             sumNT=sumNT+NT(i,j);
%             k2=k2+1;
%         end
%     end
% end
% averNT=sumNT/k2;
% 
% singal=averT-averNT;
% noise=(sum(sum(NT.*NT)')/k2-averNT*averNT)^0.5;
% SNR1=singal/noise;
% 
% %GI-flu
% T = Obj.* double(Colg2nor);
% NT= (1-Obj).* double(Colg2nor);
% sumT=0;
% sumNT=0;
% 
% k1=0;
% for i=1:single1
%     for j=1:single2
%         if T(i,j)>0
%             sumT=sumT+T(i,j);
%             k1=k1+1;
%         end
%     end
% end
% averT=sumT/k1;
% 
% k2=0;
% for i=1:single1
%     for j=1:single2
%         if NT(i,j)>0
%             sumNT=sumNT+NT(i,j);
%             k2=k2+1;
%         end
%     end
% end
% averNT=sumNT/k2;
% 
% singal=averT-averNT;
% noise=(sum(sum(NT.*NT)')/k2-averNT*averNT)^0.5;
% SNR2=singal/noise;
% 
% %GI-dif
% T = Obj.* double(Cold2nor);
% NT= (1-Obj).* double(Cold2nor);
% sumT=0;
% sumNT=0;
% 
% k1=0;
% for i=1:single1
%     for j=1:single2
%         if T(i,j)>0
%             sumT=sumT+T(i,j);
%             k1=k1+1;
%         end
%     end
% end
% averT=sumT/k1;
% 
% k2=0;
% for i=1:single1
%     for j=1:single2
%         if NT(i,j)>0
%             sumNT=sumNT+NT(i,j);
%             k2=k2+1;
%         end
%     end
% end
% averNT=sumNT/k2;
% 
% singal=averT-averNT;
% noise=(sum(sum(NT.*NT)')/k2-averNT*averNT)^0.5;
% SNR3=singal/noise;

figure;
imshow(ColG2nor,[]);title('Image');
%imwrite(ColG2nor,'J:\HBT\GI\20140324\0\GI\Image50000.bmp','bmp');
figure;
imshow(Colg2nor,[]);title('Image-flu');
%imwrite(Colg2nor,'J:\HBT\GI\20140324\0\GI\Image-flu50000.bmp','bmp');
figure;
imshow(Cold2nor,[]);title('Image-dif');
%imwrite(Cold2nor,'J:\HBT\GI\20140324\0\GI\Image-dif50000.bmp','bmp');


%SNR1,SNR2,SNR3