%图片生成
clear
num=4000;
tic
for i=1:num

H=hadamard(64);
H(H>0)=0;
H(H<0)=1;
a=H(randperm(64),randperm(64));
% r=imresize(a,4,'nearest');
% filename=['E:\仿真\哈达玛\随机\','1_1_',num2str(i),'.bmp'];
% imwrite(r,filename,'bmp');

b=-a+ones(64);
c=imresize(a,4,'nearest');
d=imresize(b,4,'nearest');
filename=['E:\随机图片\哈达玛\互补\','1_1_',num2str(2*i-1),'.bmp'];
imwrite(c,filename,'bmp');
filename=['E:\随机图片\哈达玛\互补\','1_1_',num2str(2*i),'.bmp'];
imwrite(d,filename,'bmp');
if mod(i,10)==0  %mod取模运算，结果与除数同号
    i/num
     toc  %tic toc 用于显示时间
    end  %显示已计算的进度和时间  

end

% %图片生成
% clear
% a=0;b=1;
% num=20000;
% h=768;j=1024;
% tic
% for i=1:num
% 
%     Dir2= 'E:\实验\实验数据\双光臂热光关联成像\1\2\';    %  文件夹路径
%     FileName2 =[int2str(i+999), '.jpeg'];   
%     Image002 = imread([Dir2 FileName2],'jpeg');
%     r=Image002(100:163,100:163);
% 
% %r=randi([0,1],64,64);%我们使用的DMD只能是0和1
% 
% %r=randn(64);
% 
% filename=['E:\仿真图片\1\',num2str(i),'.bmp'];
% imwrite(r,filename,'bmp');
% 
% if mod(i,10)==0  %mod取模运算，结果与除数同号
%     i/num
%      toc  %tic toc 用于显示时间
%     end  %显示已计算的进度和时间  
% 
% end