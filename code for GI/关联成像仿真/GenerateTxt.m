% b=[1,2;3,4];
% save 'D:/b.txt' -ascii b
% save b.dat -ascii b
N=10;
a=randi([0,1],1024*48*N,16);
b=dec2hex(a);
save b.dat -ascii b

% filename=[]
% dlmwrite('filename',)