%������������
%ʹ�ü�������ɵ�ɢ��ͼ����Ϊ�ο�̽��������ֵ
clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ

%o=imread('C:\Users\123456\Desktop\lena256.bmp');
o=imread('C:\Users\123456\Desktop\ͼ\buaa1.bmp');
%o=imread('C:\Users\123456\Desktop\doubleslit64.bmp');
num =10000;  %ͼƬ�ļ���
num1=1000;
num2=5000;
num3=10000;
 
h=64;j=64;
i1=0;
i2=0;
i3=0;
i4=0;
S=0;
ImageSum1 = 0;                       %  ���ڼ���<R>  
ImageSum2 = 0;                        %  ���ڼ���<S>  
ImageSum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
g1= zeros(h,j);
g2= zeros(h,j);
g3= zeros(h,j);
g4= zeros(h,j);

ImageAvep1 = zeros(h,j);
ImageAvep2 = zeros(h,j);
ImageAvep22 = zeros(h,j);


Dir1= 'E:\����ͼƬ\DMD64\';    %  �ļ���·��

tic
for I = 1 : num    %  ѭ����NUM��ͼ���ۼ� 
    ImageI=I; %ͼƬ��ţ����ڶ�ȡ
    FileName1 =[int2str(ImageI), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg  
    Image1 = imread([Dir1 FileName1],'bmp');%�ο�̽�����ⳡ�ֲ�
        
    Image2 = Image1.*o;    %Ͱ̽�����ⳡ�ֲ�
    Ima=sum(sum(Image2));          %Ͱ̽�����ܹ�ǿS
    Imb=sum(sum(Image1));
    
    ImageSum2 = ImageSum2 + Ima;      %S�ܹ�ǿ
    ImageAvep2 = ImageSum2./num;         %����S��ƽ��ֵ
    
    ImageSum1 = ImageSum1 + Imb;      %R�ܹⳡ�ֲ�
    ImageAvep1 = ImageSum1./num;    %����R��ƽ��ֵ

    ImageSum22 = ImageSum22 + double(Image1);     %<I2(x2)>�ֲ����൱�ڱ�������
    ImageAvep22 = ImageSum22./num;         %����<I2(x2)>��ƽ��ֵ
    
    if mod(I,10)==0  %modȡģ���㣬��������ͬ��
    I/num 
    toc  %tic toc ������ʾʱ��
    end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
    
end

for I = 1 : num    %  ѭ����NUM��ͼ���ۼ� 
    ImageI=I; %ͼƬ��ţ����ڶ�ȡ
    FileName1 =[int2str(ImageI), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg  
    Image1 = imread([Dir1 FileName1],'bmp');%�ο�̽�����ⳡ�ֲ�
    Image2 = Image1.*o;
    
    Ima=sum(sum(Image2));
    Imb=sum(sum(Image1));
    S=Ima-ImageAvep2;
    %S=Ima-ImageAvep2/ImageAvep1*Imb;% ʱ���Ӧ��ֹ�������
    %S=Ima./Imb-ImageAvep2/ImageAvep1;%˫��ֵʱ���Ӧ����Ͱ̽����ѡ���ź�
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

    if mod(I,10)==0  %modȡģ���㣬��������ͬ��
    I/num 
    toc  %tic toc ������ʾʱ��
    end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��   
    
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
 
% %��ֵ�����PSNR���㷽��
% O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% sub1 = CG5-o; %���ڴ洢����ԭͼ�Ĳ�
% MSE1 = sum(sum(sub1 .* sub1)')/(256*256);
% SNR1 = 10*log10(255*255/MSE1)

% %������������
% %������ʦ�ּ��㷽��
% O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% Avehuidu = sum(sum(O))./(256*256);
% sub1= O-Avehuidu;
% sub2= CGd-O;
% SNR1=sum(sum(sub1.*sub1))./sum(sum(sub2.*sub2))
