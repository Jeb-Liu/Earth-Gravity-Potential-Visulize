clear;clc;

file=load('CS_2190.mat');
CS=file.CS;
Cline=[0;0;0;CS(:,3)];
Sline=[0;0;0;CS(:,4)];

n=2190;
count=1;
for ii=1:n
    for jj=1:ii
        EGM2008_2190_C(ii,jj)=Cline(count);
        EGM2008_2190_S(ii,jj)=Sline(count);
        count=count+1;
    end
end