clear all;    %  �������
clc;    %  �����Ļ
close all;    %  �ر�ͼƬ


Dir1= 'E:\picture\';    %  �ļ���·��
Dir2= 'E:\picture\';    %  �ļ���·��
Directory1 = 'E:\picture\1001.bmp';    %  ��һ��ͼ���·�����Ա����ͼ���С
Num =2500;  %  ͼƬ�ļ���


% Image = imread(Directory1, 'bmp');    %  ��ȡ��һ��ͼ��
% [Row, Col] = size(Image); %  �õ�ͼ�����,����

Row=256;
Col=256;

% r1=100*256/1088;   r11=700*256/1088; r2=1100*256/2040;  r22=1250*256/2040;%  ��ͼ��С
% h=300*256/1088;j=830*256/2040;%  ȡ��

r1=24;   r11=168; r2=138;  r22=157;%  ��ͼ��С
h=70;j=104;%  ȡ��


single1=r11-r1+1;single2=r22-r2+1;   %��ͼ�ı߳�
 



ImageSump = zeros(single1,single2);   %  ����һ����ͼ��С����ֵ�����Ա�ͼ�����


ImageSumpp = zeros(1, 1);

Im2=zeros(r11-r1+1,r22-r2+1);

Colg2 = zeros(single1,single2);  %  g2�Ĵ洢�������ڼ�������Ĺ���
ColG2 = zeros(single1,single2);  %  G2�Ĵ洢�������ڼ������


 
tic

for I = 1 : Num    %  ѭ����NUM��ͼ���ۼ� 
    ImageI= 1000+I; %ͼƬ��ţ����ڶ�ȡ
    FileName1 =[int2str(ImageI), '.bmp'];    %  �γ��ļ����ƣ���Image1.jpg
    FileName2 =[int2str(ImageI), '.bmp'];   
 
    
    
    
    
%     Image1 = double(imread([Dir1 FileName1],'bmp')); 
%     Image2 = double(imread([Dir2 FileName2],'bmp')); 

    %  ���ļ�
    B=imread([Dir1 FileName1],'bmp');
    X=imresize(B,[256 256]);
    X=double(X);
    [a,b]=size(X);
    size_kuai=16*4;
    X2=zeros(size_kuai);  %  �ָ�����
    X3=zeros(a,b);  %  �ָ�����
    %  С���任��������
    ww=DWT(size_kuai);
    %  �����������
    M=12*4;
    R=randn(M,size_kuai);

    tic
    for i_x=1:ceil(a/size_kuai)
        for i_y=1:ceil(b/size_kuai)
            XX=X((i_x-1)*size_kuai+1:i_x*size_kuai,(i_y-1)*size_kuai+1:i_y*size_kuai);
            %  С���任��ͼ��ϡ�軯��ע��ò����ķ�ʱ�䣬���ǻ�����ϡ��ȣ�
            X1=ww*sparse(XX)*ww';
            X1=full(X1);
            %  ����
            Y=R*X1;
            %  OMP�㷨
            for i=1:size_kuai  %  ��ѭ��       
                rec=omp_fenkuai(Y(:,i),R,size_kuai);
                X2(:,i)=rec;
            end
            X3((i_x-1)*size_kuai+1:i_x*size_kuai,(i_y-1)*size_kuai+1:i_y*size_kuai)=ww'*sparse(X2)*ww;  %  С�����任
        end
    end
    X3=full(X3);


    Image1 = double(X3); 
    Image2 = double(X3); 
    
    Im2 =  Image2(r1:r11,r2:r22);   %��Image2�еľ�����ΪIm2

    Im1= Image1(h,j);  %һ����

    ImageSump= ImageSump + double(Im2);   %Im2��NUM��ͼ�����
    ImageSumpp = ImageSumpp + double(Im1); %Im1��NUM��ͼ�����

    ColG2 = ColG2 + Im1.*double(Im2); %1��2ͼƬ����������

     if mod(I,10)==0  %modȡģ���㣬��������ͬ��
        I/Num 
   toc  %tic toc ������ʾʱ��
     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��
end    
ImageAvep = ImageSump./Num; %  ���Im2��ƽ��ͼ��
ImageAvepp = ImageSumpp./Num; %  ���Im1��ƽ��ͼ��

Colg2 =(ColG2./Num)./(ImageAvep.*ImageAvepp);  %ȥ��ϵ���Ĺ���ͼ��g2

Colg2nor = Colg2./max(max(Colg2));  %������һ��ͼ��

figure;
imshow(Colg2,[]);title('Colg2');
figure;
imshow(Colg2nor,[]);title('Colg2nor');

[rows,cols]=find(Colg2==max(max(Colg2)'));
rows,cols

figure;
plot(Colg2nor(rows:rows,1:single2));title('Colg2nor');
figure;
plot(Colg2(rows:rows,1:single2));title('Colg2');
% figure;
% plot(Colg2nor(1:single1,cols:cols));title('Colg2nor');
% figure;
% plot(Colg2(1:single1,cols:cols));title('Colg2');

imagesc(Colg2);

date=Colg2nor;
mesh(date)