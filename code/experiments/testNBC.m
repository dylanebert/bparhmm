%function [] = testNBC(jobID, taskID, dir)
jobID = 3;
taskID = 1;
dir = '/media/dylan/Elements/nbc/markov_inputs/niekum/test/';

INFO = loadSamplerInfo(jobID, taskID);
OUT = loadSamplerOutput(jobID, taskID);
algParams = INFO.algParams;
outParams = INFO.outParams;
initParams.jobID = jobID;
initParams.taskID = taskID;
algParams.TimeLimit = {};
model = INFO.model;
data = readSeqDataFromPlainText(dir);

[Psi0, algP, outP] = initBPHMMPrevRun(data, model, initParams, algParams, outParams);
data = ARSeqData(1, data);
Psi0.iter = 1;
[Psi, Stats] = BPHMMsample( Psi0, data, algP );
logPr = calcJointLogPr_BPHMMState( Psi );
disp(logPr);

%for ii = 1:length(OUT.Psi)   
   %Psi = unpackBPHMMState(OUT.Psi(ii), data, INFO.model);
   %mtstream = RandStream('mt19937ar');
   %RandStream.setGlobalStream(mtstream);
   %mtstream = RandStream.setGlobalStream(mtstream);
   %mtstream.State = OUT.RandSeed(ii).matlabPRNGState;
   %randomseed(  OUT.RandSeed(ii).mexPRNGState );
   %logPr = calcJointLogPr_BPHMMState(Psi, data);
%end