clear all
% c=randi([0,1],1,5);%生成非对称托普利兹矩阵 
% r=randi([0,1],1,5);
% a=toeplitz(c,r);

H=hadamard(16);
H(H<0)=0;
H=H(randperm(16),randperm(16));
figure;
imshow(H)

