%% CARS
%+++ Guoyu Ding, 7.5, 2022.
warning off
load('raw.mat');
LV_max=20;
fold=71;
method='center';
pretr='firstdersmoothingdetrend';
X=[X1;X2];
Y=[Y1;Y2];
Y=Y(:,1);
X=X(:,1576:1638); % selected intervals by multi-objective optimization
model=[1:71];
test=[72:141];
[carsPLS2,Xsel2,Ymc2,Ymlocv2,Yp2,LV2,Rlocv2,R2cal2,R2pre2,RMSEC2,RMSECV2,RMSEP2]=dgycars(X,Y,model,test,LV_max,fold,method,pretr);

WavGlusel=Wavenum(1576:1638);
WavGlusel=WavGlusel(Xsel2);

X=[X1;X2];
Y=[Y1;Y2];
Y=Y(:,2);
X=X(:,1513:1638); % selected intervals by multi-objective optimization
model=[1:71];
test=[72:141];
[carsPLS1,Xsel1,Ymc1,Ymlocv1,Yp1,LV1,Rlocv1,R2cal1,R2pre1,RMSEC1,RMSECV1,RMSEP1]=dgycars(X,Y,model,test,LV_max,fold,method,pretr);

WavGABAsel=Wavenum(1513:1638);
WavGABAsel=WavGABAsel(Xsel1);
