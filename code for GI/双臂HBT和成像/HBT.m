clear all;    %  清除变量
clc;    %  清除屏幕
close all;    %  关闭图片


Dir1= 'E:\picture\';    %  文件夹路径
Dir2= 'E:\picture\';    %  文件夹路径
Directory1 = 'E:\picture\1001.bmp';    %  第一幅图像的路径，以便测试图像大小
Num =2500;  %  图片文件数


% Image = imread(Directory1, 'bmp');    %  读取第一幅图像
% [Row, Col] = size(Image); %  得到图像的行,列数

Row=256;
Col=256;

% r1=100*256/1088;   r11=700*256/1088; r2=1100*256/2040;  r22=1250*256/2040;%  截图大小
% h=300*256/1088;j=830*256/2040;%  取点

r1=24;   r11=168; r2=138;  r22=157;%  截图大小
h=70;j=104;%  取点


single1=r11-r1+1;single2=r22-r2+1;   %截图的边长
 



ImageSump = zeros(single1,single2);   %  生成一个截图大小的零值矩阵，以便图像求和


ImageSumpp = zeros(1, 1);

Im2=zeros(r11-r1+1,r22-r2+1);

Colg2 = zeros(single1,single2);  %  g2的存储矩阵，用于计算涨落的关联
ColG2 = zeros(single1,single2);  %  G2的存储矩阵，用于计算关联


 
tic

for I = 1 : Num    %  循环将NUM幅图像累加 
    ImageI= 1000+I; %图片标号，用于读取
    FileName1 =[int2str(ImageI), '.bmp'];    %  形成文件名称，如Image1.jpg
    FileName2 =[int2str(ImageI), '.bmp'];   
 
    
    
    
    
%     Image1 = double(imread([Dir1 FileName1],'bmp')); 
%     Image2 = double(imread([Dir2 FileName2],'bmp')); 

    %  读文件
    B=imread([Dir1 FileName1],'bmp');
    X=imresize(B,[256 256]);
    X=double(X);
    [a,b]=size(X);
    size_kuai=16*4;
    X2=zeros(size_kuai);  %  恢复矩阵
    X3=zeros(a,b);  %  恢复矩阵
    %  小波变换矩阵生成
    ww=DWT(size_kuai);
    %  随机矩阵生成
    M=12*4;
    R=randn(M,size_kuai);

    tic
    for i_x=1:ceil(a/size_kuai)
        for i_y=1:ceil(b/size_kuai)
            XX=X((i_x-1)*size_kuai+1:i_x*size_kuai,(i_y-1)*size_kuai+1:i_y*size_kuai);
            %  小波变换让图像稀疏化（注意该步骤会耗费时间，但是会增大稀疏度）
            X1=ww*sparse(XX)*ww';
            X1=full(X1);
            %  测量
            Y=R*X1;
            %  OMP算法
            for i=1:size_kuai  %  列循环       
                rec=omp_fenkuai(Y(:,i),R,size_kuai);
                X2(:,i)=rec;
            end
            X3((i_x-1)*size_kuai+1:i_x*size_kuai,(i_y-1)*size_kuai+1:i_y*size_kuai)=ww'*sparse(X2)*ww;  %  小波反变换
        end
    end
    X3=full(X3);


    Image1 = double(X3); 
    Image2 = double(X3); 
    
    Im2 =  Image2(r1:r11,r2:r22);   %引Image2中的矩阵作为Im2

    Im1= Image1(h,j);  %一个点

    ImageSump= ImageSump + double(Im2);   %Im2的NUM张图像求和
    ImageSumpp = ImageSumpp + double(Im1); %Im1的NUM张图像求和

    ColG2 = ColG2 + Im1.*double(Im2); %1、2图片做关联运算

     if mod(I,10)==0  %mod取模运算，结果与除数同号
        I/Num 
   toc  %tic toc 用于显示时间
     end  %显示已计算的进度和时间
end    
ImageAvep = ImageSump./Num; %  求得Im2的平均图像
ImageAvepp = ImageSumpp./Num; %  求得Im1的平均图像

Colg2 =(ColG2./Num)./(ImageAvep.*ImageAvepp);  %去掉系数的关联图像g2

Colg2nor = Colg2./max(max(Colg2));  %关联归一化图像

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