function [xsnv]=dgysnv(x)
%+++ Guoyu Ding, 6.15, 2019.
[m,n]=size(x);
xsnv=(x-mean(x')'*ones(1,n))./(std(x')'*ones(1,n));