clc;
clear all;
clear;
M=1024;
N=768;
num=2000;
% strfile=strcat('DMD','.dat');
fid1=fopen('D:\DMDdata\64_48\11\1.dat','wb+');
tic
for i=1:num
    A=zeros(M,N);
    B=randi([0,1],256,192);      
%     B=randi([0,1],64,64);

%     H=hadamard(128);
%     H(H>0)=0;
%     H(H<0)=1;
%     B=H(randperm(128),randperm(128));
    
    C=imresize(B,4,'nearest');
%      A(400:655,400:655)=C;
    A=C;
     
    fwrite(fid1,A,'uint8');

    if mod(i,10)==0  %mod取模运算，结果与除数同号
        i/num
    toc  %tic toc 用于显示时间
    end  %显示已计算的进度和时间
     
clear A;
end
fclose(fid1);
% imshow(C)
% imwrite(C,'C:\Users\Administrator\Desktop\DMD256.bmp')
% 
% fid2=fopen('C:\Documents and Settings\Administrator\Desktop\full.dat','r');
% x=cell(num,1);
% for i=1:num
%     status=fseek(fid2,(i-1)*M*N,'bof');
%     x{i}=fread(fid2,[M,N],'uint8');
% %     x{i}=y{i}(0:255,0:255);
% end
% figure;
% imshow(x{8,1});