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



for i=1:71
    XGLU=selXGLU;
    YGLU=Y1(:,1);
    XGLU(i,:)=[];
    YGLU(i,:)=[];
    [XL,YL,XS,YS,BETA]=plsregress(XGLU,YGLU,14);
    YGLUcal(i)=[ones(1,1) selXGLU(i,:)]*BETA;
end
R2GLU=1-sum((YGLUcal'-Y1(:,1)).^2)/sum((Y1(:,1)-mean(Y1(:,1))).^2)

X20 = dgyfirstder(X2,7,3);
X22 = dgydetrend(X20);
selvaw1=sel1(logical(GLU));
selvaw2=sel1(logical(GABA));
selXGLU1=X22(:,[selvaw1{:}]);
selXGABA1=X22(:,[selvaw2{:}]);

[XL,YL,XS,YS,BETA]=plsregress(selXGLU,Y1(:,1),14);
YGLUval=[ones(70,1) selXGLU1]*BETA;
R2GLUpre=1-sum((YGLUval-Y2(:,1)).^2)/sum((Y2(:,1)-mean(Y2(:,1))).^2)




for i=1:71
    XGABA=selXGABA;
    YGABA=Y1(:,2);
    XGABA(i,:)=[];
    YGABA(i,:)=[];
    [XL,YL,XS,YS,BETA]=plsregress(XGABA,YGABA,15);
    YGABAcal(i)=[ones(1,1) selXGABA(i,:)]*BETA;
end
R2GABA=1-sum((YGABAcal'-Y1(:,2)).^2)/sum((Y1(:,2)-mean(Y1(:,2))).^2)

X20 = dgyfirstder(X2,7,3);
X22 = dgydetrend(X20);
selvaw1=sel1(logical(GLU));
selvaw2=sel1(logical(GABA));
selXGLU1=X22(:,[selvaw1{:}]);
selXGABA1=X22(:,[selvaw2{:}]);

[XL,YL,XS,YS,BETA]=plsregress(selXGABA,Y1(:,2),15);
YGABAval=[ones(70,1) selXGABA1]*BETA;
R2GABApre=1-sum((YGABAval-Y2(:,2)).^2)/sum((Y2(:,2)-mean(Y2(:,2))).^2)




figure
subplot(1,2,2)
x=Y2(:,1); 
y=YGLUval; 
[p,S]=polyfit(x,y,1); 


[y_fit,delta]=polyval(p,x,S);

uy=y_fit+2*delta;
dy=y_fit-2*delta;

plot(x,y,'rx','LineWidth',1.2)
hold on

plot(x,y_fit,'Color',[82,124,179]./255,'LineWidth',1.5)


plot([x],[uy],'Color',[82,124,179]./255,'LineWidth',1.2,'LineStyle',':')
plot([x],[dy],'Color',[82,124,179]./255,'LineWidth',1.2,'LineStyle',':')

% [M,I] =max(y_fit);
% fill([x(1:I),flipud(x(1:I))],[uy(1:I),flipud(dy(1:I))],[82,124,179]./255,'EdgeColor','none','FaceAlpha',.2)
 [xx,I] = sort(x);
fill([xx;flipud(xx)],[dy(I);flipud(uy(I))],[82,124,179]./255,'EdgeColor','none','FaceAlpha',.2)
xlabel('True values (g/L)','Fontname','Times New Roman','Fontsize',12)
ylabel('Fitted values (g/L)','Fontname','Times New Roman','Fontsize',12)
title('Linear Fit of Glu concentration (g/L) with 95% Prediction Interval','Fontname','Times New Roman','position',[20,46.4])
legend('Glu','Linear Fit','95% Prediction Interval','Location','NorthWest','Fontname','Times New Roman') 

txt = ['y=' num2str(p(1)) 'x + ' num2str(p(2))];
text(25,20,txt,'Fontname','Times New Roman','Fontsize',11)

subplot(1,2,1)
x=Y2(:,2); 
y=YGABAval; 
[p,S]=polyfit(x,y,1); 


[y_fit,delta]=polyval(p,x,S);

uy=y_fit+2*delta;
dy=y_fit-2*delta;

plot(x,y,'kx','LineWidth',1.2)
hold on

plot(x,y_fit,'Color',[234,37,185]./255,'LineWidth',1.5)


plot([x],[uy],'Color',[234,37,185]./255,'LineWidth',1.2,'LineStyle',':')
plot([x],[dy],'Color',[234,37,185]./255,'LineWidth',1.2,'LineStyle',':')

% [M,I] =max(y_fit);
% fill([x(1:I),flipud(x(1:I))],[uy(1:I),flipud(dy(1:I))],[82,124,179]./255,'EdgeColor','none','FaceAlpha',.2)
 [xx,I] = sort(x);
fill([xx;flipud(xx)],[dy(I);flipud(uy(I))],[234,37,185]./255,'EdgeColor','none','FaceAlpha',.2)

xlabel('True values (g/L)','Fontname','Times New Roman','Fontsize',12)
ylabel('Fitted values (g/L)','Fontname','Times New Roman','Fontsize',12)
title('Linear Fit of GABA concentration (g/L) with 95% Prediction Interval','Fontname','Times New Roman','position',[70,145])
legend('GABA','Linear Fit','95% Prediction Interval','Location','NorthWest','Fontname','Times New Roman') 

txt = ['y=' num2str(p(1)) 'x - ' num2str(-p(2))];
text(65,50,txt,'Fontname','Times New Roman','Fontsize',11)
