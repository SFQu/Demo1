%ͼƬ����
clear
num=4000;
tic
for i=1:num

H=hadamard(64);
H(H>0)=0;
H(H<0)=1;
a=H(randperm(64),randperm(64));
% r=imresize(a,4,'nearest');
% filename=['E:\����\������\���\','1_1_',num2str(i),'.bmp'];
% imwrite(r,filename,'bmp');

b=-a+ones(64);
c=imresize(a,4,'nearest');
d=imresize(b,4,'nearest');
filename=['E:\���ͼƬ\������\����\','1_1_',num2str(2*i-1),'.bmp'];
imwrite(c,filename,'bmp');
filename=['E:\���ͼƬ\������\����\','1_1_',num2str(2*i),'.bmp'];
imwrite(d,filename,'bmp');
if mod(i,10)==0  %modȡģ���㣬��������ͬ��
    i/num
     toc  %tic toc ������ʾʱ��
    end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��  

end

% %ͼƬ����
% clear
% a=0;b=1;
% num=20000;
% h=768;j=1024;
% tic
% for i=1:num
% 
%     Dir2= 'E:\ʵ��\ʵ������\˫����ȹ��������\1\2\';    %  �ļ���·��
%     FileName2 =[int2str(i+999), '.jpeg'];   
%     Image002 = imread([Dir2 FileName2],'jpeg');
%     r=Image002(100:163,100:163);
% 
% %r=randi([0,1],64,64);%����ʹ�õ�DMDֻ����0��1
% 
% %r=randn(64);
% 
% filename=['E:\����ͼƬ\1\',num2str(i),'.bmp'];
% imwrite(r,filename,'bmp');
% 
% if mod(i,10)==0  %modȡģ���㣬��������ͬ��
%     i/num
%      toc  %tic toc ������ʾʱ��
%     end  %��ʾ�Ѽ���Ľ��Ⱥ�ʱ��  
% 
% end