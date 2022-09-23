function Xscalenew = dgyauto_pre(Xnew,meanXold,stdXold)
%+++ Guoyu Ding, 6.15, 2019.
[n,m] = size(Xnew);
Xscalenew = (Xnew-meanXold(ones(n,1),:))./stdXold(ones(n,1),:);
end

