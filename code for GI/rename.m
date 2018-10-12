clear all;
clc;

filename = dir('*.bmp');
for i = 1:length(filename)
    [s,m,p] = movefile(filename(i).name, [num2str(i) '.bmp']); 
end