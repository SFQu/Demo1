%���������·����Ӧ����
clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ

num1 =500;
num2 =1000;
num =2000;  %ͼƬ�ļ���

h=1024;
j=768;
i1=0;
i2=0;
S=0;
ImageSum1 = 0;                       %  ���ڼ���<R>  
ImageSum2 = 0;                        %  ���ڼ���<S>  
ImageSum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
g= zeros(h,j);
g1= zeros(h,j);
g2= zeros(h,j);
G= zeros(256,256);
G1= zeros(256,256);
G2= zeros(256,256);
ImageAvep1 = zeros(h,j);
ImageAvep2 = zeros(h,j);
ImageAvep22 = zeros(h,j);

Dir1= 'G:\image_save\20150509\';    %  �ļ���·��
fid2=fopen('C:\Documents and Settings\Administrator\Desktop\2000_64_256.dat','r');
tic
for I = 5: num    %  ѭ����NUM��ͼ���ۼ� 
    FileName1=['1_1_',int2str(I), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg 
    Image1 = imread([Dir1 FileName1],'bmp');%�ο�̽�����ⳡ�ֲ�
   Im1=sum(sum(Image1(505:515,530:600)));
    
    status=fseek(fid2,(I-1)*h*j+1,'bof');
    o=fread(fid2,[h,j],'uint8');
     O=o(300:555,300:555);
    G=G+double(Im1).*O;

%     ImageSum1 = ImageSum1 + double(Ima);      %S�ܹ�ǿ
%     ImageAvep1 = ImageSum1./num;         %����S��ƽ��ֵ
%  
%     ImageSum22 = ImageSum22 + double(Image1);      %<I2(x2)>�ֲ����൱�ڱ�������
%     ImageAvep22 = ImageSum22./num;         %����<I2(x2)>��ƽ��ֵ
    
    if mod(I,10)==0  %modȡģ���㣬��������ͬ��
    I/num 
    toc  %tic toc ������ʾʱ��
    end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
    
   if I == num1   %  ѭ����NUM��ͼ���ۼ� 

    G1=G;

%     ImageSum1 = ImageSum1 + double(Ima);      %S�ܹ�ǿ
%     ImageAvep1 = ImageSum1./num;         %����S��ƽ��ֵ
%  
%     ImageSum22 = ImageSum22 + double(Image1);      %<I2(x2)>�ֲ����൱�ڱ�������
%     ImageAvep22 = ImageSum22./num;         %����<I2(x2)>��ƽ��ֵ
    
    
    CG1=uint8(round(255 * ((G1-min(min(G1)))./(max(max(G1))-min(min(G1))))));
figure;
imshow(CG1)

end

if I ==  num2   %  ѭ����NUM��ͼ���ۼ� 

    G2=G;

%     ImageSum1 = ImageSum1 + double(Ima);      %S�ܹ�ǿ
%     ImageAvep1 = ImageSum1./num;         %����S��ƽ��ֵ
%  
%     ImageSum22 = ImageSum22 + double(Image1);      %<I2(x2)>�ֲ����൱�ڱ�������
%     ImageAvep22 = ImageSum22./num;         %����<I2(x2)>��ƽ��ֵ
    
    CG2=uint8(round(255 * ((G2-min(min(G2)))./(max(max(G2))-min(min(G2))))));
figure;
imshow(CG2)


end

end

CG=uint8(round(255 * ((G-min(min(G)))./(max(max(G))-min(min(G))))));
figure;
imshow(CG)





% for I = 1 : num    %  ѭ����NUM��ͼ���ۼ� 
%     ImageI=I; %ͼƬ��ţ����ڶ�ȡ
%     FileName1 =[int2str(ImageI), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg  
%     Image1 = imread([Dir1 FileName1],'bmp');%�ο�̽�����ⳡ�ֲ�
%     Image2 = Image1.*o;
%     
%     Ima=sum(sum(Image2));          %Ͱ̽�����ܹ�ǿS
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
%     if mod(I,10)==0  %modȡģ���㣬��������ͬ��
%     I/num 
%     toc  %tic toc ������ʾʱ��
%     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��   
%     
% end

% G1=g1/i1;%��Ӧ����
% G2=g2/i2;%��Ӧ����
% G3=g1/i1-ImageAvep22;%��Ӧ�����ȥ��������
% G4=g2/i2-ImageAvep22;%��Ӧ�����ȥ��������
% G5=G1-G2;%��Ӧ�����ȥ����
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
 
% %��ֵ�����PSNR���㷽��
% O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% sub1 = CG5-o; %���ڴ洢����ԭͼ�Ĳ�
% MSE1 = sum(sum(sub1 .* sub1)')/(256*256);
% SNR1 = 10*log10(255*255/MSE1)

% % ʱ���Ӧ��ֹ�������
% % ʹ�ü�������ɵ�ɢ��ͼ����Ϊ�ο�̽��������ֵ
% clear all;    %  �������
% clc;    %  �����Ļ
% close all;    %  �ر�ͼƬ
% 
% %o=imread('C:\Users\123456\Desktop\lena256.jpg');
% o=imread('C:\Users\123456\Desktop\ͼ\buaa1.bmp');
% num =5000;  %ͼƬ�ļ���
% num1=1000;
% num2=5000;
% num3=10000;
%  
% h=64;j=64;
% i1=0;
% i2=0;
% S=0;
% ImageSum1 = 0;                       %  ���ڼ���<R>  
% ImageSum2 = 0;                        %  ���ڼ���<S>  
% ImageSum22 = zeros(h,j);  %  ���ڼ���<I2(x2)>
% g1= zeros(h,j);
% g2= zeros(h,j);
% G= zeros(h,j);
% ImageAvep1 = zeros(h,j);
% ImageAvep2 = zeros(h,j);
% ImageAvep22 = zeros(h,j);
% 
% Dir1= 'E:\����ͼƬ\DMD64\';    %  �ļ���·��
% 
% tic
% for I = 1 : num    %  ѭ����NUM��ͼ���ۼ� 
%     ImageI=I; %ͼƬ��ţ����ڶ�ȡ
%     FileName1 =[int2str(ImageI), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg  
%     Image1 = imread([Dir1 FileName1],'bmp');%�ο�̽�����ⳡ�ֲ�
%  
%     Image2 = Image1.*o;    %Ͱ̽�����ⳡ�ֲ�
%     Ima=sum(sum(Image2));          %Ͱ̽�����ܹ�ǿS
%     Imb=sum(sum(Image1));          %�ο�̽�����ܹ�ǿR
%    
%     ImageSum1 = ImageSum1 + double(Ima);      %S�ܹ�ǿ
%     ImageSum2 = ImageSum2 + double(Imb);      %R�ܹ�ǿ
%    
%     ImageAvep1 = ImageSum1./num;         %����S��ƽ��ֵ
%     ImageAvep2 = ImageSum2./num;         %����R��ƽ��ֵ 
% 
%     ImageSum22 = ImageSum22 + double(Image1);      %<I2(x2)>�ֲ����൱�ڱ�������
%     ImageAvep22 = ImageSum22./num;         %����<I2(x2)>��ƽ��ֵ
% 
%     if mod(I,10)==0  %modȡģ���㣬��������ͬ��
%     I/num 
%     toc  %tic toc ������ʾʱ��
%     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
%     
% end
% 
% for I = 1 : num    %  ѭ����NUM��ͼ���ۼ� 
%     ImageI=I; %ͼƬ��ţ����ڶ�ȡ
%     FileName1 =[int2str(ImageI), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg  
%     Image1 = imread([Dir1 FileName1],'bmp');%�ο�̽�����ⳡ�ֲ�
%     Image2 = Image1.*o;
%     
%     Ima=sum(sum(Image2));          %Ͱ̽�����ܹ�ǿS
%     Imb=sum(sum(Image1));          %�ο�̽�����ܹ�ǿR   
%     %S=Ima-ImageAvep1/ImageAvep2*Imb;% ʱ���Ӧ��ֹ�������
%     S=Ima./Imb-ImageAvep1/ImageAvep2;%˫��ֵʱ���Ӧ����Ͱ̽����ѡ���ź�
%   if S>0
%       i1=i1+1;
%       g1=g1+double(Image1);   
%         else if S<0
%           i2=i2+1;
%           g2=g2+double(Image1);   
%             end
%   end
%   
%      if mod(I,10)==0  %modȡģ���㣬��������ͬ��
%     I/num 
%     toc  %tic toc ������ʾʱ��
%     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��    
% end
% 
% G1=g1/i1;%��Ӧ����
% G2=g2/i2;%��Ӧ����
% G3=g1/i1-ImageAvep22;%��Ӧ�����ȥ��������
% G4=g2/i2-ImageAvep22;%��Ӧ�����ȥ��������
% G5=G1-G2;%��Ӧ�����ȥ����
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
% % %������������
% % %������ʦ�ּ��㷽��
% % O=uint8(round(255 * ((o-min(min(o)'))./(max(max(o)')-min(min(o)')))));
% % Avehuidu = sum(sum(O))./(256*256);
% % sub1= O-Avehuidu;
% % sub2= CGd-O;
% % SNR1=sum(sum(sub1.*sub1))./sum(sum(sub2.*sub2))
