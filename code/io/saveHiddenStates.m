function [] = saveHiddenStates( jobID, taskID, dir )

data = loadSamplerInfo(jobID, taskID).data;
OUT = loadSamplerOutput(jobID, taskID);

dir = strcat('D:/nbc/bparhmm/outputs/', dir);
mkdir(dir);
Psi = OUT.Psi(length(OUT.Psi));

for ii = 1:data.N
    fname = data.seqNames{ii};
    path = fullfile(dir, fname);
    z = Psi.stateSeq(ii).z;
    save(path, 'z');
end