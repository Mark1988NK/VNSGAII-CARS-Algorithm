%% pareto front display
%+++ Guoyu Ding, 7.5, 2022.
load('mulcalint30preder1detrend.mat');

selSCORE=SCORE(3001:3100,:);
nondominatedRank = nonDominatedRank(selSCORE);


property=max(nondominatedRank);
% colorpic=autumn(property);
colorpic=hsv(property);
colormap(colorpic);
for i=1:max(nondominatedRank)
    plot(selSCORE(nondominatedRank==i,1),selSCORE(nondominatedRank==i,2),'o','color',colorpic(i,:),'Markersize',max(5.5-i,3),'MarkerFaceColor',colorpic(i,:))
    hold on
end

h1=colorbar;
label={'Rank1','Rank2','Rank3','Rank4','Rank5'};
xlabel('RMSECV for Glu')
ylabel('RMSECV for GABA')
set(h1,'YTick',[0.1:0.2:0.9],'YTicklabel',[label],'FontSize',10,'FontName','Times New Roman')
hold on
[Glumin,Gluindex]=min(selSCORE(:,1));
[GABAmin,GABAindex]=min(selSCORE(:,2));
plot(selSCORE(Gluindex,1),selSCORE(Gluindex,2),'^','Markersize',8,'color','k')
plot(selSCORE(GABAindex,1),selSCORE(GABAindex,2),'^','Markersize',8,'color','k')
box off