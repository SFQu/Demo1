o1=imread('E:\����ͼƬ\��˹256\1.bmp');
b=ones(2);
%b=[1,0;0,1];
%image1=imdilate(a,b);
image2=imerode(o1,b);
imshow(image2)
imhist(image2)
% o=imread('E:\ʵ��\ʵ������\˫����ȹ��������\1\2\1000.jpeg');
% image3=o(100:355,100:355);
% 
% subplot(2,2,1);
% imhist(double(image2)/255);
% subplot(2,2,2);
% imhist(double(image3)/255);
% subplot(2,2,3);
% imshow(image2);
% subplot(2,2,4);
% imshow(image3);