function [Xmsc,Xmeancal]=dgymsc(X)
%+++ Guoyu Ding, 6.15, 2019.
[n,m]=size(X);
Xmeancal=mean(X);
for i=1:n
    coef=polyfit(Xmeancal,X(i,:),1);
    Xmsc(i,:)=(X(i,:)-coef(2))/coef(1);
end