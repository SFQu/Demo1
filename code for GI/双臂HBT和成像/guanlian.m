clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ


Dir1= 'E:\ʵ��\ʵ������\˫����ȹ��������\1\1\';    %  �ļ���·��
Dir2= 'E:\ʵ��\ʵ������\˫����ȹ��������\1\2\';    %  �ļ���·��
Num1 = 5000;  %  ͼƬ�ļ���
Num2 = 10000;
Num3 = 20000;
Num = 5000;

single1=270;single2=270;                      %  Ŀ����Ĵ�С
x1=358; y1=445; x2=366; y2=364;               %  ���й����ĵ�,1(y1,x1),2(y2,x2)
a0=216; b0=327;                               %  Ͱ̽������ͼ���(b0,a0)
c0=x2-x1+a0; d0=y2+y1-b0;                     %  �ο�̽������ͼ���
a=a0+1; b=a0+single1; c=b0+1; d=b0+single2;   %  �趨Image1�Ľ�ͼ��Χ
a1=c0+1;b1=c0+single1;c1=d0-single2;d1=d0-1;  %  �趨Image2�Ľ�ͼ��Χ

Image01 =  zeros(single1,single2);
% Image02 =  zeros(single1,single2);
Image1  =  zeros(single1,single2);
Image2  =  zeros(single1,single2);


ImageSump1 = 0;                       %  ���ڼ���<I1>  ��S
ImageSump22=0;                        %  ���ڼ���<I2>  ��R
ImageSump2 = zeros(single1,single2);  %  ���ڼ���<I2(x2)>

ColG2 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������
Colg2 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ���ȥ�������ĳ���
Col = zeros(single1,single2);    %  G2�Ĵ洢�������ڼ����ֳ���

Image1Sump1 = 0;                       %  ���ڼ���<I1>  ��S
Image1Sump22=0;                        %  ���ڼ���<I2>  ��R
Image1Sump2 = zeros(single1,single2);  %  ���ڼ���<I2(x2)>

Col1G2 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������
Col1g2 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ���ȥ�������ĳ���
Col1 = zeros(single1,single2);    %  G2�Ĵ洢�������ڼ����ֳ���

Image2Sump1 = 0;                       %  ���ڼ���<I1>  ��S
Image2Sump22=0;                        %  ���ڼ���<I2>  ��R
Image2Sump2 = zeros(single1,single2);  %  ���ڼ���<I2(x2)>

Col2G2 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������
Col2g2 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ���ȥ�������ĳ���
Col2 = zeros(single1,single2);    %  G2�Ĵ洢�������ڼ����ֳ���

Image3Sump1 = 0;                       %  ���ڼ���<I1>  ��S
Image3Sump22=0;                        %  ���ڼ���<I2>  ��R
Image3Sump2 = zeros(single1,single2);  %  ���ڼ���<I2(x2)>

Col3G2 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������
Col3g2 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ���ȥ�������ĳ���
Col3 = zeros(single1,single2);    %  G2�Ĵ洢�������ڼ����ֳ���

tic

for I = 1 : Num    %  ѭ����NUM��ͼ���ۼ� 
    ImageI=999+I; %ͼƬ��ţ����ڶ�ȡ
    FileName1 =[int2str(ImageI), '.jpeg'];    %  �γ��ļ����ƣ���Image1.jpg
    FileName2 =[int2str(ImageI), '.jpeg'];   
    Image001 = imread([Dir1 FileName1],'jpeg');
    Image002 = imread([Dir2 FileName2],'jpeg');
    Image1  =  Image001(a:b,c:d);
    Image2   =  Image002(a1:b1,c1:d1);
    
    Ima=sum(sum(Image1)');           %Ͱ̽����S
    Imb=sum(sum(Image2)');           %Ͱ̽����R

    ImageSump1 = ImageSump1 + double(Ima);      %S�ܹ�ǿ
    ImageSump2 = ImageSump2 + double(Image2);     %����I2(x2)
    ImageSump22 = ImageSump22 + double(Imb);      %R�ܹ�ǿ
    %�������������ͼƬ�����ֵ���ٽ��й�������

    ColG2 = ColG2 + Ima .* double(Image2);              %��������S*I2(x2)
    Col   = Col + Imb .* double(Image2);                %����R*I2(x2)
    
     if mod(I,10)==0  %modȡģ���㣬��������ͬ��
        I/Num 
        toc  %tic toc ������ʾʱ��
     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
     
     if I==Num1
         Image1Sump1 = ImageSump1;
         Image1Sump2 = ImageSump2;
         Image1Sump22 = ImageSump22;
         Col1G2 = ColG2;
         Col1   = Col;
         
         Image1Avep1 = Image1Sump1./Num1;  %  ���S��ƽ��ͼ��
         Image1Avep2 = Image1Sump2./Num1;  %  ���R��ƽ��ͼ��
         Image1Avep22= Image1Sump22./Num1; %  ���R*I2(x2)��ƽ��ͼ��
         
         Col1g2 = Col1G2./Num1-Image1Avep1.*Image1Avep2;    %�������ͼ��
         Col1d2 = Col1G2./Num1- Image1Avep1./Image1Avep22 .* Col1./Num1; %��ֹ����
         
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
         
         Image2Avep1 = Image2Sump1./Num2;  %  ���S��ƽ��ͼ��
         Image2Avep2 = Image2Sump2./Num2;  %  ���R��ƽ��ͼ��
         Image2Avep22= Image2Sump22./Num2; %  ���R*I2(x2)��ƽ��ͼ��
         
         Col2g2 = Col2G2./Num2-Image2Avep1.*Image2Avep2;    %�������ͼ��
         Col2d2 = Col2G2./Num2- Image2Avep1./Image2Avep22 .* Col2./Num2; %��ֹ����
         
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
         
         Image3Avep1 = Image3Sump1./Num3;  %  ���S��ƽ��ͼ��
         Image3Avep2 = Image3Sump2./Num3;  %  ���R��ƽ��ͼ��
         Image3Avep22= Image3Sump22./Num3; %  ���R*I2(x2)��ƽ��ͼ��
         
         Col3g2 = Col3G2./Num3-Image3Avep1.*Image3Avep2;    %�������ͼ��
         Col3d2 = Col3G2./Num3- Image3Avep1./Image3Avep22 .* Col3./Num3; %��ֹ����

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

ImageAvep1 = ImageSump1./Num;  %  ���S��ƽ��ͼ��
ImageAvep2 = ImageSump2./Num;  %  ���R��ƽ��ͼ��
ImageAvep22= ImageSump22./Num; %  ���R*I2(x2)��ƽ��ͼ��

Colg2 = ColG2./Num-ImageAvep1.*ImageAvep2;    %�������ͼ��
Cold2 = ColG2./Num- ImageAvep1./ImageAvep22 .* Col./Num; %��ֹ����

ColG2nor=uint8(round(255 * ((ColG2-min(min(ColG2)'))./(max(max(ColG2)')-min(min(ColG2)')))));
Colg2nor=uint8(round(255 * ((Colg2-min(min(Colg2)'))./(max(max(Colg2)')-min(min(Colg2)')))));
Cold2nor=uint8(round(255 * ((Cold2-min(min(Cold2)'))./(max(max(Cold2)')-min(min(Cold2)')))));

% %������������
% sub1 = zeros(single1,single2);   %���ڴ洢����ԭͼ�Ĳ�
% sub1 = double(ColG2nor)-Obj0;
% MSE1 = sum(sum(sub1 .* sub1)')/(single1*single2);
% SNR1 = 10*log(255*255/MSE1);
% 
% sub2 = zeros(single1,single2);   %���ڴ洢����ԭͼ�Ĳ�
% sub2 = double(Colg2nor)-Obj0;
% MSE2 = sum(sum(sub2 .* sub2)')/(single1*single2);
% SNR2 = 10*log(255*255/MSE2);
% 
% sub3 = zeros(single1,single2);   %���ڴ洢����ԭͼ�Ĳ�
% sub3 = double(Cold2nor)-Obj0;
% MSE3 = sum(sum(sub3 .* sub3)')/(single1*single2);
% SNR3 = 10*log(255*255/MSE3);

% %ʹ����ѩ��ķ���
% T = zeros(single1,single2);   %���ڼ���͸�ⲿ��
% NT= zeros(single1,single2);   %���ڼ��㲻͸�ⲿ��
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