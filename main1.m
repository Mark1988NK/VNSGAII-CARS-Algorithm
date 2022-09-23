%+++ Guoyu Ding, 7.5, 2022.
load('raw');
%% Divide the spectrum into 10-50 equal parts
n=size(sel,2);
int=30; %10 20 30 40 50
intval=floor(n/int);

for i=1:int-1
    sel1{i}=sel(intval*(i-1)+1:intval*i);
end

sel1{int}=sel(intval*i+1:n);
%% Spectrum pretreatment - Der1 + Detrend
X10 = dgyfirstder(X1,7,3);
X11 = dgydetrend(X10); % 14 different kinds of Spectrum pretreatment methods
%% Multi-objective optimization, Start with the default options
options = optimoptions('gamultiobj');
PopulationSize_Data=100;
ParetoFraction_Data=0.5;
MaxGenerations_Data=3000;
MaxStallGenerations_Data=MaxGenerations_Data;
nvars=int;
%% Modify options setting
options = optimoptions(options,'PopulationType', 'bitstring');
options = optimoptions(options,'PopulationSize', PopulationSize_Data);
options = optimoptions(options,'ParetoFraction', ParetoFraction_Data);
options = optimoptions(options,'MaxGenerations', MaxGenerations_Data);
options = optimoptions(options,'MaxStallGenerations', MaxStallGenerations_Data);
options = optimoptions(options,'MutationFcn', {  @mutationuniform 0.05 });
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'OutputFcn', { @outfun5int30preder1detrend });
options = optimoptions(options,'UseVectorized', false);
options = optimoptions(options,'UseParallel', true);
[x,fval,exitflag,output,population,score] = ...
    gamultiobj(@(index)f5(index,X11,Y1,sel1),nvars,[],[],[],[],[],[],[],options);





