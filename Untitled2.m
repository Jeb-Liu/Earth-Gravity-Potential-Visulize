clear;
clc;
d=1;
n=10;
load('EGM2008_2190_C.mat');
load('EGM2008_2190_S.mat');
global C S
C = EGM2008_2190_C;
S = EGM2008_2190_S;

left=1;%degree
right=360;
down=1;
up=180;

UU=zeros(180/d,360/d);
for ii=down:up/d
    for jj=left:right/d
        
        lat=deg2rad((ii-1)*d-90);
        lon=deg2rad((jj-1)*d);
        
        x=6371000*cos(lon)*cos(lat);
        y=6371000*sin(lon)*cos(lat);
        z=6371000*sin(lat);
        
        u=C_1_10(x,y,z,n);
        UU(ii,jj)=(norm(u)-9.80665);
    end
end

figure(1);
fig=heatmap(UU,'Title','n = 1000');
fig.ColorLimits = [-0.04 0.04];
fig.GridVisible = 'off';
fig.CellLabelColor = 'none';
fig.NodeChildren(3).YDir='normal';    
colormap default
fig.XDisplayLabels = nan(size(fig.XDisplayData));
fig.YDisplayLabels = nan(size(fig.YDisplayData));


