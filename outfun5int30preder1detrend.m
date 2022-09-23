function [state,options,optchanged] = outfun5int30preder1detrend(options,state,flag)
%+++ Guoyu Ding, 7.5, 2022.
optchanged = false;
persistent SCORE population spread distance averagedistance

switch flag
    case 'init'
        
        
        
        disp('Starting the algorithm');
        %% Data initialization
        SCORE((options.Generations/100+1)*options.PopulationSize,2)=0;
        population((options.Generations/100+1)*options.PopulationSize,size(options.PopInitRange,2))=0;
        distance((options.Generations/100+1)*options.PopulationSize,1)=0;
        averagedistance((options.Generations/100+1),1)=0;
        %% Data assignment
        
        SCORE((state.Generation*options.PopulationSize+1):(state.Generation+1)*options.PopulationSize,1:2)=state.Score;
        population((state.Generation*options.PopulationSize+1):(state.Generation+1)*options.PopulationSize,1:size(options.PopInitRange,2))=state.Population;
        distance((state.Generation*options.PopulationSize+1):(state.Generation+1)*options.PopulationSize,1)=state.Distance;
        averagedistance(state.Generation+1,1)=state.AverageDistance;
    case {'iter','interrupt'}
        if mod(state.Generation+1,100)==0
            iter1=(state.Generation+1)/100;
            SCORE((iter1*options.PopulationSize+1):(iter1+1)*options.PopulationSize,1:2)=state.Score;
            population((iter1*options.PopulationSize+1):(iter1+1)*options.PopulationSize,1:size(options.PopInitRange,2))=state.Population;
            distance((iter1*options.PopulationSize+1):(iter1+1)*options.PopulationSize,1)=state.Distance;
            averagedistance(iter1+1,1)=state.AverageDistance;
            disp('Iterating ...');
            disp(state.Generation+1);
        else
        end
    case 'done'
        spread=state.Spread;
        save 'mulcalint30preder1detrend.mat' SCORE population spread distance averagedistance
        disp('Performing final task');
        clear SCORE population spread distance averagedistance
end

%%%