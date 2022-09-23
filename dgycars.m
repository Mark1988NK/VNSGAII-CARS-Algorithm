function [carsPLS,Xsel,Ymc,Ymlocv,Yp,LV,Rlocv,R2cal,R2pre,RMSEC,RMSECV,RMSEP]=dgycars(X,Y,model,test,LV_max,fold,method,pretr)
%% output
%+++ Xsel:points selected by CARS

%% input
% X:The data matrix of size m x p
% Y:The response vector of size m x 1
% model:the calibration set
% test:the validation set
% LV_max:Latent variable number
% fold:the group number for cross validation.
% method:pretreatment method.

%+++ Guoyu Ding, 3.6,2017.
%+++ guoyuding@mail.nankai.edu.cn
%+++ Ref:  Guoyu Ding, Yanshuai Wang, Aina Liu, Yuanyuan Hou, Tiejun Zhang, Gang Bai and Changxiao Liu
% From chemical markers to quality markers: an integrated approach of UPLC/Q-TOF, NIRS, and
% chemometrics for the quality assessment of honeysuckle buds
% RSC Advances, 2017, 7(36):22034-22044
if strcmp(pretr,'none')
    X=X;
elseif  strcmp(pretr,'snv')
    X=dgysnv(X);
elseif  strcmp(pretr,'detrend')
    X=dgydetrend(X);
elseif  strcmp(pretr,'snvdetrend')
    X=dgydetrend(dgysnv(X));
elseif  strcmp(pretr,'smoothing')
    X=dgysmoothing(X,9,3);
elseif  strcmp(pretr,'firstdersmoothing')
    X=dgysmoothing(dgyfirstder(X,9,3),9,3);
elseif  strcmp(pretr,'firstdersmoothingsnv')
    X=dgysnv(dgysmoothing(dgyfirstder(X,9,3),9,3));
elseif  strcmp(pretr,'firstdersmoothingdetrend')
    X=dgydetrend(dgyfirstder(X,7,3));
elseif  strcmp(pretr,'seconddersmoothing')
    X=dgysmoothing(dgysecondder(X,9,3),9,3);
else
    errordlg('noptr')
end
Xtrain=X(model,:);
Ytrain=Y(model,:);
Xtest=X(test,:);
Ytest=Y(test,:);
CV=plscvfold(Xtrain,Ytrain,LV_max,fold,method,0);
F=carspls(Xtrain,Ytrain,CV.optPC,fold,method,100);
variables_cars=F.vsel;
XXtrain=Xtrain(:,F.vsel);
XXtest=Xtest(:,F.vsel);
CV=plscvfold(XXtrain,Ytrain,F.optPC,fold,method,0);
LV_cars =CV.optPC;
PLS=pls(XXtrain,Ytrain,LV_cars,method);
carsPLS=PLS; 
Xtest_expand=[XXtest ones(size(Xtest,1),1)];
coef=PLS.coef_origin;
ypred=Xtest_expand*coef(:,end);

SST=sum((Ytest-mean(Ytest)).^2);
SSE=sum((Ytest-ypred).^2);
R2cal =PLS.R2;
R2pre =1-SSE/SST;
RMSEC =sqrt(PLS.SSE/size(Xtrain,1));
RMSEP =sqrt(SSE/size(Xtest,1));
Rlocv=CV.R;
Ymlocv=CV.Ypred;
RMSECV=CV.RMSECV;
Ymc=PLS.y_est;
Yp=ypred;
LV=CV.optPC;
Xsel=F.vsel;









