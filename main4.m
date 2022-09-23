%% Regression coefficient for GABA and Glu
%+++ Guoyu Ding, 7.5, 2022.
warning off
load('mulcalint30preder1detrend.mat');
load('raw.mat');
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
selXGLU=X11(:,[selvaw1{:}]);
selXGABA=X11(:,[selvaw2{:}]);
unselvaw1=sel1(~logical(GLU));
unselvaw2=sel1(~logical(GABA));
GLUbeta0=zeros(1,1906);
GABAbeta0=zeros(1,1906);
[XL1,YL1,XS1,YS1,BETA1,PCTVAR1,MSE1]=plsregress(selXGLU,Y1(:,1),15,'CV','resubstitution');
[XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2]=plsregress(selXGABA,Y1(:,2),15,'CV','resubstitution');

subplot(1,2,1)
plot(MSE2(2,2:end),'-o','linewidth',2,'color','r','MarkerSize',4)
set(gca,'XTick',[1:1:15])
box off
subplot(1,2,2)
plot(MSE1(2,2:end),'-o','linewidth',2,'MarkerSize',4)
set(gca,'XTick',[1:1:15])
box off


[XL1,YL1,XS1,YS1,BETA1,PCTVAR1,MSE1]=plsregress(selXGLU,Y1(:,1),4,'CV','resubstitution');
[XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2]=plsregress(selXGABA,Y1(:,2),4,'CV','resubstitution');
GLUbeta0(:,[selvaw1{:}])=BETA1(2:end);
GABAbeta0(:,[selvaw2{:}])=BETA2(2:end);


n=size(sel,2);
int=30;
intval=floor(n/int);
for i=1:int-1
    sel1{i}=sel(intval*(i-1)+1:intval*i);
end
sel1{int}=sel(intval*i+1:n);
subplot(2,1,1)
hold on
plot(GABAbeta0')
sumnum=0;
for i=1:30
    num=size(sel1{i},2);
    plot([sumnum+num,sumnum+num],[-5000,5000],'k')
    sumnum=sumnum+num;
end

plot([0,1906],[0,0],'k')
axis([0 1906 -5000 5000])
set(gca,'xtick',linspace(30,1870,30))
set(gca,'xticklabel',num2cell(1:30))
ylabel('Regression coefficient for GABA')
box off



subplot(2,1,2)
hold on
plot(GLUbeta0')
sumnum=0;
for i=1:30
    num=size(sel1{i},2);
    plot([sumnum+num,sumnum+num],[-5000,5000],'k')
    sumnum=sumnum+num;
end

plot([0,1906],[0,0],'k')
axis([0 1906 -5000 5000])
set(gca,'xtick',linspace(30,1870,30))
set(gca,'xticklabel',num2cell(1:30))
ylabel('Regression coefficient for Glu')
box off
