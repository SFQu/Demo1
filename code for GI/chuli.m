clear all

% open('C:\Users\Administrator\Desktop\64.fig'); 
% h=get(gca,'Children'); 
% p1=get(h,'Cdata');
% % p1 = rgb2gray(I);                % rgb תΪ�Ҷ�ͼ                    
% [y,x]=size(p1);                 % ȡ��ͼ���С
% [X,Y]=meshgrid(1:x,1:y); % ������������
% pp=double(p1);              % uint8 ת��Ϊdouble 
% mesh(X,Y,pp);                % ��ͼ
% colormap gray;               % ѡΪ�Ҷ�

% open('C:\Users\Administrator\Desktop\64.fig'); 
% h=get(gca,'Children'); 
% I=get(h,'Cdata');
% I1 = I; I2 = I; I3 = I;
% I1(I1>60 & I1<120) = 255;
% I2(I2>20 & I2<50) = 255;
% I3(I3>80 & I3<160) = 255;
% J = cat(3, I1, I2, I3);
% figure;
% subplot(1, 2, 1); imshow(I, []); title('By lyqmath ԭͼ', 'FontWeight', 'Bold', 'Color', 'r');
% subplot(1, 2, 2); imshow(J, []); title('By lyqmath ��ɫͼ', 'FontWeight', 'Bold', 'Color', 'r');


% clear;
% A=ones(256,256);
% A(:,1:128)=0;%1
% A(1:128,1:128)=0;%2
% A(129:256,129:256)=0;
% A(:,[1:64,129:192])=0;%3
% A([1:64,129:192],[1:64,129:192])=0;%4
% A([65:128,193:256],[65:128,193:256])=0;
% imwrite(A,'C:\Users\Administrator\Desktop\���Ӷ�ͼ��\fuzha4.jpg');
% imshow(A);

% clear;
% strfile=strcat('��ֵ','-','center','.dat');
% fid1=fopen(strfile,'wb+');
% num=10;
% for i=1:num    
% A=randi([0,1],768,1024);
% end
% count=fwrite(fid1,A,'uint8');
% clear A;
% fclose(fid1);
% 
% Dir1= 'C:\Users\Administrator\Desktop\1\';    %  �ļ���·��
% num=2;
% tic
% for I = 1 : num    %  ѭ����NUM��ͼ���ۼ� 
%     FileName2=strcat('1_1_',num2str(I),'.bmp');
%     Image1 = imread([Dir1 FileName2],'bmp');%�ο�̽�����ⳡ�ֲ�  
% end
% imshow(Image1)

%I = imread('C:\Users\Administrator\Desktop\1.jpg');
%J = imresize(I, 0.5);
%figure, imshow(I), figure, imshow(J)

% open('C:\Users\Administrator\Desktop\����͸�������\��ͬ��Сɢ�ߵ�HBTʵ����\256\256.fig'); 
% h=get(gca,'Children'); 
% a=get(h,'Cdata');
% % imwrite(a,'C:\Users\Administrator\Desktop\128.bmp');
% b = im2double(a);%��0~255ת��0~1
% % subplot(121); imshow(a);
% % subplot(122); imshow(b);
% [rows,cols]=find(a==max(max(a)));
% 
% rows
% cols
% 
% figure;
% plot(b(rows:rows,1:256),'g');
% figure;
% plot(b(1:256,cols:cols),'g');


% open('C:\Users\Administrator\Desktop\20150507\ʵ��\˫�۹����ʵ���¼\�����HBT�͸���\����\1.fig'); 
% h=get(gca,'Children'); 
% a=get(h,'Cdata');
% imwrite(a,'C:\Users\Administrator\Desktop\20150507\ʵ��\˫�۹����ʵ���¼\�����HBT�͸���\����\2.bmp')

% open('C:\Users\Administrator\Desktop\����͸�������\��ͬ��Сɢ�ߵ�HBTʵ����\32\32.fig'); 
% h=get(gca,'Children'); 
% a=get(h,'Cdata');
% A= im2double(a);
% [rows1,cols]=find(A==max(max(A)));
% 
% open('C:\Users\Administrator\Desktop\����͸�������\��ͬ��Сɢ�ߵ�HBTʵ����\64\64.fig'); 
% h=get(gca,'Children'); 
% b=get(h,'Cdata');
% B= im2double(b);
% [rows2,cols]=find(B==max(max(B)));
% 
% open('C:\Users\Administrator\Desktop\����͸�������\��ͬ��Сɢ�ߵ�HBTʵ����\128\128.fig'); 
% h=get(gca,'Children'); 
% c=get(h,'Cdata');
% C= im2double(c);
% [rows3,cols]=find(C==max(max(C)));
% 
% open('C:\Users\Administrator\Desktop\����͸�������\��ͬ��Сɢ�ߵ�HBTʵ����\256\256.fig'); 
% h=get(gca,'Children'); 
% d=get(h,'Cdata');
% D= im2double(d);
% [rows4,cols]=find(D==max(max(D)));

% open('C:\Users\Administrator\Desktop\20150507\����HBT��͸�������\����HBTʵ����\256\2000.fig'); 
% h=get(gca,'Children'); 
% e=get(h,'Cdata');
% E= im2double(e);
% [rows5,cols]=find(E==max(max(E)));

% figure;
% plot(A(rows1:rows1,1:256),'r');
% hold on
% plot(B(rows2:rows2,1:256),'y');
% hold on
% plot(C(rows3:rows3,1:256),'b');
% hold on
% plot(D(rows4:rows4,1:256),'g');
% hold on
% plot(E(rows5:rows5,1:256),'g');
% hold on
% a=randn([0,1],3,3)

% ������������
% ������ʦ�ּ��㷽��
% o=imread('C:\Users\Administrator\Desktop\����ͼƬ\lena256.bmp');
% O=imread('C:\Users\Administrator\Desktop\������\lena\8000.bmp');
% % O=imread('C:\Users\Administrator\Desktop\2.bmp');
% Avehuidu = sum(sum(o))./(256*256);
% sub1= double(o)-double(Avehuidu);
% sub2= double(O)-double(o);
% SNR1=sum(sum(sub1.*sub1))./sum(sum(sub2.*sub2))

% %��ֵ�����PSNR���㷽��
% o=imread('C:\Users\Administrator\Desktop\����ͼƬ\buaa256.bmp');
% O=imread('C:\Users\Administrator\Desktop\��ͬ�㷨������\DGI\buaa\8000\f.bmp');
% sub1 = O-o; %���ڴ洢����ԭͼ�Ĳ�
% MSE1 = sum(sum(sub1 .* sub1))./(256*256);
% SNR2 = 10*log(255*255./MSE1)
% 
x=[500:1500:8000];
y1=[0.5697 0.6385	0.8484	0.8851	0.9627	1.0560];
y2=[0.8445	1.2726	1.6110	1.8348	2.0968	2.4034];
y3=[0.4836	0.5830	0.7714	0.8933	1.0174	1.1073];
y4=[0.8802	1.2846	1.5432	1.8041	1.9839	2.2511];
% y5=[0.8554	1.1644	1.2703	1.4457	1.7030	1.8665];
% y6=[0.8010	1.1094	1.3241	1.4090	1.8185	2.0031];
figure;
plot(x,y1,'--k+');%axis([0 max(x) 0 max(y1)])
hold on 
plot(x,y2,'--ro');%axis([0 max(x) 0 max(y2)])
hold on 
plot(x,y3,'-b*');%axis([0 max(x) 0 max(y3)])
hold on 
plot(x,y4,'--g.');%axis([0 max(x) 0 max(y4)])
% hold on 

% plot(x,y5,'--mx');%axis([0 max(x) 0 max(y4)])
% hold on 
% plot(x,y6,'--y^');%axis([0 max(x) 0 max(y4)])

% a=load('C:\Users\Administrator\Desktop\S.txt')
% [r c]=size(a);
% number=r*c
% mean(a)%ƽ��ֵ
% % var(a);%����
% std(a)%��׼�������

% open('C:\Users\Administrator\Desktop\����͸�������\��ͬ�۽��Ĺ��ֳ�����\ɢ��2\2000.fig');
% h=get(gca,'Children'); 
% a=get(h,'Cdata');
% imwrite(a,'C:\Users\Administrator\Desktop\����͸�������\��ͬ�۽��Ĺ��ֳ�����\ɢ��2\2000.bmp');



% N=1996;%������Ҫ��ʾ�����ݵĸ���
% fid1=fopen('C:\Users\Administrator\Desktop\���Ͱ̽�����ź�\�۽�\SC1.txt');
% fid2=fopen('C:\Users\Administrator\Desktop\���Ͱ̽�����ź�\�۽�\SC2.txt');
% fid3=fopen('C:\Users\Administrator\Desktop\���Ͱ̽�����ź�\�۽�\SC3.txt');
% % fid4=fopen('C:\Users\Administrator\Desktop\���Ͱ̽�����ź�\�۽�\SC.txt');
% for i=1:N 
% a(i)=fscanf(fid1,'%f',1);%һ��һ���Ķ�ȡ���ݣ���ֵ��a
% b(i)=fscanf(fid2,'%f',1);
% c(i)=fscanf(fid3,'%f',1);
% % d(i)=fscanf(fid4,'%f',1);
% end
% fclose(fid1);
% fclose(fid2);
% fclose(fid3);
% % fclose(fid4);
% % plot(a);%��ͼ 
% % hist(a,100);
% 
% % [y,x]=hist(a,100);         %��Ϊ100������ͳ�ƣ�(����Ը�����Ҫ��������)
% % y1=y/length(a)/mean(diff(x));   %��������ܶ� ��Ƶ�����������������������
% % [y,x]=hist(b,100);       
% % y2=y/length(b)/mean(diff(x)); 
% % figure;
% % bar(x,y1,1);       %��bar��ͼ������1�ǻ�barͼÿ��bar�Ŀ�ȣ�Ĭ����0.8���Բ���������Ϊ1�Ϳ�����
% % hold on
% % bar(x,y2,1);
% 
% figure;
% [f,aa] = ksdensity(a); %���ܶȹ���
% plot(aa,f,'r'); % ����������ܶ����� 
% hold on
% [f,bb] = ksdensity(b); %���ܶȹ���
% plot(bb,f,'g'); % ����������ܶ����� 
% hold on
% [f,cc] = ksdensity(c); %���ܶȹ���
% plot(cc,f,'b'); % ����������ܶ�����
% % hold on
% % [f,dd] = ksdensity(d); %���ܶȹ���
% % plot(dd,f,'m'); % ����������ܶ�����


