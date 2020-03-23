function [] = runNBC( jobID, taskID, dir )

data = readSeqDataFromPlainText(dir);
data = ARSeqData(1, data);
disp(data);
modelP = {'obsM.Scoef', 0.5};
T0 = 50;
Tf = 10000;
algP = {'doSampleFUnique', 0, 'doSampleUniqueZ', 1, 'doSplitMerge', 1, 'RJ.birthPropDistr', 'DataDriven', 'doAnneal', 'Lin', 'Anneal.T0', T0, 'Anneal.Tf', Tf};
initP = {'F.nTotal', 1};
runBPHMM(data, modelP, {jobID, taskID}, algP, initP);