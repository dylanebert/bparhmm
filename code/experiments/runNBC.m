function [] = runNBC( jobID, taskID )

dataP = {'nbc'};
modelP = {};
T0 = 50;
Tf = 10000;
algP = {'doSampleFUnique', 0, 'doSampleUniqueZ', 1, 'doSplitMerge', 1, 'RJ.birthPropDistr', 'DataDriven', 'doAnneal', 'Lin', 'Anneal.T0', T0, 'Anneal.Tf', Tf};
initP = {'F.nTotal', 1};
runBPHMM(dataP, modelP, {jobID, taskID}, algP, initP);