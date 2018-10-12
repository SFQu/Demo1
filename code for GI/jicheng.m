clear;
%[FileName_wr,PathName_wr]=uiputfile('*.dat');
%str_wr=[FileName_wr,PathName_wr];
n=98304;
pin = 16;%pin=1,2,4,8,16,32,64,128,256
huidu = 511;%huidu=255,511,1023
m = 768./pin; n = 1024./pin;
str1=num2str(huidu);
str2=num2str(pin);
myFile=strcat('huidu','-',str1,'-',str2,'.dat');
fid_wr=fopen(myFile,'wb+');
for i=1:1:3
    [FileName,PathName] = uigetfile('*.dat');
   % fullname=fullfile(PathName, FileName);
    str=[PathName,FileName];

    fid=fopen(str,'r');
    [Ir,n]=fread(fid,[1024,96],'char');
    
    count=fwrite(fid_wr,Ir,'char');
   % fclose(fid);
end
