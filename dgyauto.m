function [Xauto,meanX,stdX] = dgyauto(X)
%+++ Guoyu Ding, 6.15, 2019.
[n,m] = size(X);
meanX = mean(X);
stdX  = std(X);
Xauto = (X-meanX(ones(n,1),:))./stdX(ones(n,1),:);