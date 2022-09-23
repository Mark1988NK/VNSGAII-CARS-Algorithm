%%  the PLS models of GABA and L-Glu on under 30 equidistant intervals and Der1 + Detrend pretreatment.
%+++ Guoyu Ding, 7.5, 2022.
warning off
load('raw');
load('mulcalint30preder1detrend.mat');

X10 = dgyfirstder(X1,7,3);
X11 = dgydetrend(X10); % 14 different kinds of Spectrum pretreatment methods

n=size(sel,2);
int=30; %10 20 30 40 50
intval=floor(n/int);
for i=1:int-1
    sel1{i}=sel(intval*(i-1)+1:intval*i);
end
sel1{int}=sel(intval*i+1:n);



selSCORE=SCORE(:,:);
[~,b1]=min(selSCORE(:,1));
[~,b2]=min(selSCORE(:,2));
GLU=population(b1,:);
GABA=population(b2,:);

selvaw1=sel1(logical(GLU));
selvaw2=sel1(logical(GABA));
selXGLU=X11(:,[selvaw1{:}]);
selXGABA=X11(:,[selvaw2{:}]);

CVO=cvpartition(Y1(:,1),'leaveout');

[XL1,YL1,XS1,YS1,BETA1,PCTVAR1,MSE1]=plsregress(selXGLU,Y1(:,1),15,'CV',CVO);
[XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2]=plsregress(selXGABA,Y1(:,2),15,'CV',CVO);

[~,CV1]=min(MSE1(2,:));
[~,CV2]=min(MSE2(2,:));

RMSECVGlu=sqrt(MSE1(2,CV1));
RMSECVGABA=sqrt(MSE2(2,CV2));

[XL1,YL1,XS1,YS1,BETA1,PCTVAR1,MSE1]=plsregress(selXGLU,Y1(:,1),CV1-1,'CV','resubstitution');
[XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2]=plsregress(selXGABA,Y1(:,2),CV2-1,'CV','resubstitution');
RMSECGlu=sqrt(MSE1(2,CV1));
RMSECGABA=sqrt(MSE2(2,CV2));

MeanGlu=mean(Y1(:,1));
MeanGABA=mean(Y1(:,2));
X20 = dgyfirstder(X2,7,3);
X22 = dgydetrend(X20);

selvaw1=sel1(logical(GLU));
selvaw2=sel1(logical(GABA));
selXpreGLU=X22(:,[selvaw1{:}]);
selXpreGABA=X22(:,[selvaw2{:}]);

selXpreGLU=[ones(size(selXpreGLU,1),1) selXpreGLU];
selXpreGABA=[ones(size(selXpreGABA,1),1) selXpreGABA];

Glufit=selXpreGLU*BETA1(1:end);
GABAfit=selXpreGABA*BETA2(1:end);

preGluRMSEP=sqrt(sum(abs(Glufit-Y2(:,1)).^2)/size(X2,1));
preGABARMSEP=sqrt(sum(abs(GABAfit-Y2(:,2)).^2)/size(X2,1));

fid=fopen('int30result.txt','w');
fprintf(' Com | Spectral pretreatments | LVs | RMSEC | RMSECV | RMSEP\n');
fprintf(fid,'%4s | %22s | %3d | %2.2f  | %2.2f   | %2.2f\n','Glu','Der1 + Detrend',CV1-1,RMSECGlu,RMSECVGlu,preGluRMSEP);
fprintf(fid,'%4s | %22s | %3d | %2.2f  | %2.2f   | %2.2f\n','GABA','Der1 + Detrend',CV2-1,RMSECGABA,RMSECVGABA,preGABARMSEP);
type('int30result.txt')