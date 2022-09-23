function R=f5(index,X1,Y1,sel1)
%+++ Guoyu Ding, 6.15, 2019.
selX=X1(:,cell2mat(sel1(logical(index))));
CVO=cvpartition(Y1(:,1),'leaveout');
NV=size(selX,2);
if NV>=15
    [XL1,YL1,XS1,YS1,BETA1,PCTVAR1,MSE1]=plsregress(selX,Y1(:,1),15,'CV',CVO);
    [XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2]=plsregress(selX,Y1(:,2),15,'CV',CVO);
    [~,b1]=max(diff(MSE1(2,:)));
    [~,b2]=max(diff(MSE2(2,:)));
    R(1)=roundn(sqrt(MSE1(2,b1)),-5);
    R(2)=roundn(sqrt(MSE2(2,b2)),-5);
else
    R(1)=inf;
    R(2)=inf;
end