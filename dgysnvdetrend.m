function [xdetrend]=dgysnvdetrend(x)
%+++ Guoyu Ding, 6.15, 2019.
[m,n]=size(x);
xsnv=(x-mean(x')'*ones(1,n))./(std(x')'*ones(1,n));
var=[1:n];
for i=1:m
    p=polyfit(var,xsnv(i,:),2);				%fit a second-degree polynomial to the baseline of each spectrum
    xdetrend(i,:)=xsnv(i,:)-(p(1)*var.^2+p(2)*var+p(3));	%subtract this function to any spectral data of the spectrum
end