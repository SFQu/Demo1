clear all
% c=randi([0,1],1,5);%���ɷǶԳ��������Ⱦ��� 
% r=randi([0,1],1,5);
% a=toeplitz(c,r);

H=hadamard(16);
H(H<0)=0;
H=H(randperm(16),randperm(16));
figure;
imshow(H)

