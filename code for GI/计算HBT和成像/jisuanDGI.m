%���������·����Ӧ����
clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ

num1 =10;
num2 =1000;
num =1024;  %ͼƬ�ļ���

m=1024;
n=768;

% h=256;
% j=256;
h=1024;
j=768;

ImageSum1 = 0;                       %  ���ڼ���<R>  
ImageSum2 = 0;                        %  ���ڼ���<S>  
ImageSum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
g= zeros(h,j);
G= zeros(h,j);
ImageAvep1 = zeros(h,j);
ImageAvep2 = zeros(h,j);
ImageAvep22 = zeros(h,j);
 
Image1Sum1 = 0;                       %  ���ڼ���<R>  
Image1Sum2 = 0;                        %  ���ڼ���<S>  
Image1Sum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
g1= zeros(h,j);
G1= zeros(h,j);
Image1Avep1 = zeros(h,j);
Image1Avep2 = zeros(h,j);
Image1Avep22 = zeros(h,j);
 
Image2Sum1 = 0;                       %  ���ڼ���<R>  
Image2Sum2 = 0;                        %  ���ڼ���<S>  
Image2Sum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
g2= zeros(h,j);
G2= zeros(h,j);
Image2Avep1 = zeros(h,j);
Image2Avep2 = zeros(h,j);
Image2Avep22 = zeros(h,j);
tongtanceqizhi=zeros(num,1);

Dir1= 'E:\shuju\';    %  �ļ���·��
fid2=fopen('E:\hadamard\1.dat','r');
tic
for I = 1: num    %  ѭ����NUM��ͼ���ۼ� 
         if I<10
     FileName1=['acA2000-165uc (21534555)_20170427_183928970_000',int2str(I), '.bmp'];%Ͱ̽��������ֵ
    Im1 = imread([Dir1 FileName1],'bmp');
        end
    if (I>=10&&I<100)
     FileName1=['acA2000-165uc (21534555)_20170427_183928970_00',int2str(I), '.bmp'];%Ͱ̽��������ֵ
    Im1 = imread([Dir1 FileName1],'bmp'); 
    end
    if (I>=100&&I<1000)
     FileName1=['acA2000-165uc (21534555)_20170427_183928970_0',int2str(I), '.bmp'];%Ͱ̽��������ֵ
    Im1 = imread([Dir1 FileName1],'bmp');   
    end
    if(I>=1000)
     FileName1=['acA2000-165uc (21534555)_20170427_183928970_',int2str(I), '.bmp'];%Ͱ̽��������ֵ
    Im1 = imread([Dir1 FileName1],'bmp');  
    end
%     FileName1=['1_1_',int2str(I), '.bmp'];%Ͱ̽��������ֵ
%     Im1 = imread([Dir1 FileName1],'bmp');
    %Image1=Im1(300:450,1170: 1280);
   Image1=Im1(:,:,2);
    Ima=sum(sum(Image1));
    tongtanceqizhi(I)=Ima; 
%   fid1=['C:\Documents and Settings\Administrator\Desktop\S2.txt','.txt'];
%     c=fopen(fid1,'a');
%     fprintf(c,'%f\n',Ima);
%      fclose(c);
    
    status=fseek(fid2,(I-1)*m*n+1,'bof');%�ο�̽������ȡֵ
    o=fread(fid2,[m,n],'uint8');
%     Image2=o(400:900,300:750);
    Image2=o;
    Imb=sum(sum(Image2));
    
    ImageSum1 = ImageSum1 + double(Ima);      %S�ܹ�ǿ
    ImageSum2 = ImageSum2 + double(Imb);      %R�ܹ�ǿ
    ImageSum22 = ImageSum22 + double(Image2);     %����I2(x2)
   
    G = G + Ima.*double(Image2);              %��������S*I2(x2)
    g = g + Imb.*double(Image2);              %����R*I2(x2)
    
    ImageAvep1 = ImageSum1./num;         %����S��ƽ��ֵ
    ImageAvep2 = ImageSum2./num;         %����R��ƽ��ֵ 
    ImageAvep22 = ImageSum22./num;        %����R��ƽ��ͼ��
     
    if mod(I,10)==0  %modȡģ���㣬��������ͬ��
    I/num 
    toc  %tic toc ������ʾʱ��
    end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
    
%    if I == num1   %  ѭ����NUM��ͼ���ۼ� 
% 
%         Image1Sum1 = ImageSum1;
%         Image1Sum2 = ImageSum2;
%         Image1Sum22 = ImageSum22;
%         
%         G1 = G;
%         g1 = g;
%       
%         Image1Avep1 = Image1Sum1./num1;         %����S��ƽ��ֵ
%         Image1Avep2 = Image1Sum2./num1;         %����R��ƽ��ֵ 
%         Image1Avep22 = Image1Sum22./num1;        %����R��ƽ��ͼ��
%     
%         Gt1 = G1./num1;                             %��ͳ����� 
%         Gf1 = G1./num1 - Image1Avep1.*Image1Avep22;    %�������ͼ��
%         Gd1 = G1./num1 - Image1Avep1./Image1Avep2 .* g1./num1; %��ֹ����
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
%     if I ==  num2   %  ѭ����NUM��ͼ���ۼ� 
% 
%         Image1Sum1 = ImageSum1;
%         Image1Sum2 = ImageSum2;
%         Image1Sum22 = ImageSum22;
%         
%         G1 = G;
%         g1 = g;
%       
%         Image1Avep1 = Image1Sum1./num1;         %����S��ƽ��ֵ
%         Image1Avep2 = Image1Sum2./num1;         %����R��ƽ��ֵ 
%         Image1Avep22 = Image1Sum22./num1;        %����R��ƽ��ͼ��
%     
%         Gt1 = G1./num1;                             %��ͳ����� 
%         Gf1 = G1./num1 - Image1Avep1.*Image1Avep22;    %�������ͼ��
%         Gd1 = G1./num1 - Image1Avep1./Image1Avep2 .* g1./num1; %��ֹ����
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

Gt = G./num;                             %��ͳ����� 
Gf = G./num - ImageAvep1.*ImageAvep22;    %�������ͼ��
Gd = G./num - ImageAvep1./ImageAvep2 .* g./num; %��ֹ����
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
imshow(CGd);
figure;plot(tongtanceqizhi);

%imwrite(CGd,'C:\Documents and Settings\Administrator\Desktop\KK\1.bmp');

% %��ֵ�����PSNR���㷽��
% O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% sub1 = CG5-o; %���ڴ洢����ԭͼ�Ĳ�
% MSE1 = sum(sum(sub1 .* sub1)')/(256*256);
% SNR1 = 10*log10(255*255/MSE1)

% % %������������
% % %������ʦ�ּ��㷽��
% % O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% % Avehuidu = sum(sum(O))./(256*256);
% % sub1= O-Avehuidu;
% % sub2= CGd-O;
% % SNR1=sum(sum(sub1.*sub1))./sum(sum(sub2.*sub2))
