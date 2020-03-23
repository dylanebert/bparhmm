function [] = saveHiddenStates( jobID, taskID )

data = loadSamplerInfo(jobID, taskID).data;
OUT = loadSamplerOutput(jobID, taskID);

dir = strcat('/media/dylan/Elements/nbc/markov_outputs/final/');
Psi = OUT.Psi(length(OUT.Psi));

for ii = 1:data.N
    fname = data.seqNames{ii};
    path = fullfile(dir, fname);
    z = Psi.stateSeq(ii).z;
    save(path, 'z');
end