
%ʹ��DMD����������·������HBTʵ��
clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ

num1 =500;
num2 =1000;
num =2000;  %ͼƬ�ļ���

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

Dir1= 'G:\image_save\����\103001\r\';    %  �ļ���·��
fid2=fopen('C:\Documents and Settings\Administrator\Desktop\full.dat','r');
tic
for I = 5: num    %  ѭ����NUM��ͼ���ۼ� 
    FileName1=['1_1_',int2str(I), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg 
    Image1 = imread([Dir1 FileName1],'bmp');%�ο�̽�����ⳡ�ֲ�
    Im1=sum(sum(Image1(689,549)));
    
    status=fseek(fid2,(I-1)*m*n+1,'bof');
    o=fread(fid2,[m,n],'uint8');
     O=o;
    g=g+double(Im1).*O;
    
    if mod(I,10)==0  %modȡģ���㣬��������ͬ��
    I/num
    toc  %tic toc ������ʾʱ��
    end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
    
    
    
    if I == num1   %  ѭ����NUM��ͼ���ۼ�    
    g1=g;
    G1=g1./num1;
    CG1=uint8(round(255 * ((G1-min(min(G1)))./(max(max(G1))-min(min(G1))))));
    figure;
    imshow(CG1)
    end

    if I ==  num2   %  ѭ����NUM��ͼ���ۼ�
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
