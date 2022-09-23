%% CARS result display
%+++ Guoyu Ding, 7.5, 2022.
warning off
load('raw.mat');
X10 = dgyfirstder(X1,7,3);
X11 = dgydetrend(X10);
X12=X11(:,1513:1638);
subplot(3,1,1)
hold on
plot(X12')
xticklabels1={};
for i=1513:20:1638
    temp=num2str(roundn(Wavenum(i),0));
    xticklabels1=[xticklabels1 temp];
end
set(gca,'xtick',[1:20:126])
set(gca,'xticklabel',xticklabels1,'XLim',[1 126],'YLim',[-0.003 0.003])
ylabel('Log(1/R)')
box off



%% CARS points analysis
warning off
load('mulcalint30preder1detrend.mat');
load('CARSresult.mat');
n=size(sel,2);
int=30;
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

X10 = dgyfirstder(X1,7,3);
X11 = dgydetrend(X10);

selvaw1=sel1(logical(GLU));
selvaw2=sel1(logical(GABA));
selXGLU=X11(:,[selvaw1{3}]);
selXGABA=X11(:,[selvaw2{7:8}]);
unselvaw1=sel1(~logical(GLU));
unselvaw2=sel1(~logical(GABA));
GLUbeta0=zeros(1,1906);
GABAbeta0=zeros(1,1906);


[XL1,YL1,XS1,YS1,BETA1,PCTVAR1,MSE1]=plsregress(selXGLU,Y1(:,1),2,'CV','resubstitution');
[XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2]=plsregress(selXGABA,Y1(:,2),4,'CV','resubstitution');
GLUbeta0(:,[selvaw1{3}])=BETA1(2:end);
GABAbeta0(:,[selvaw2{7:8}])=BETA2(2:end);



subplot(3,1,2)
GABApoint=Xsel1;
hold on
GABAbeta1=GABAbeta0(:,1513:1638);
plot(GABAbeta1')
plot(GABApoint,GABAbeta1(GABApoint),'r.')
xticklabels1={};
for i=1513:20:1638
    temp=num2str(roundn(Wavenum(i),0));
    xticklabels1=[xticklabels1 temp];
end
set(gca,'xtick',[1:20:126])
set(gca,'xticklabel',xticklabels1,'XLim',[1 126],'YLim',[-30000 20000])
ylabel('Regression coefficient for GABA')
box off

subplot(3,1,3)
Glupoint=63 + Xsel2;
hold on
GLUbeta1=GLUbeta0(:,1513:1638);
plot(GLUbeta1')
plot(Glupoint,GLUbeta1(Glupoint),'b.')
xticklabels1={};
for i=1513:20:1638
    temp=num2str(roundn(Wavenum(i),0));
    xticklabels1=[xticklabels1 temp];
end
set(gca,'xtick',[1:20:126])
set(gca,'xticklabel',xticklabels1,'XLim',[1 126],'YLim',[-6000 4500])
ylabel('Regression coefficient for Glu')
box off