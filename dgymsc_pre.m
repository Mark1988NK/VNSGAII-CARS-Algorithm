function Xpmsc=dgymsc_pre(Xp,Xmeancal)
%+++ Guoyu Ding, 6.15, 2019.
[n,m]=size(Xp);
for i=1:n
    coef=polyfit(Xmeancal,Xp(i,:),1);
    Xpmsc(i,:)=(Xp(i,:)-coef(2))/coef(1);
end