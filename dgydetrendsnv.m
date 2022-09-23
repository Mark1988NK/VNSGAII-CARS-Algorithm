function [xsnv]=dgydetrendsnv(x)
%+++ Guoyu Ding, 6.15, 2019.
[m,n]=size(x);
var=[1:n];
for i=1:m
    p=polyfit(var,x(i,:),2);				%fit a second-degree polynomial to the baseline of each spectrum
    xdetrend(i,:)=x(i,:)-(p(1)*var.^2+p(2)*var+p(3));	%subtract this function to any spectral data of the spectrum
end
xsnv=(xdetrend-mean(xdetrend')'*ones(1,n))./(std(xdetrend')'*ones(1,n));