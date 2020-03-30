DATA_DIR = 'D:/nbc/bparhmm/inputs';
SAVE_DIR = 'D:/nbc/bparhmm/inputs/10hz';
LAG_LENGTH = 1;

ChannelNames = {'pos.x', 'pos.y', 'pos.z', 'rot.x', 'rot.y', 'rot.z', 'rot.w'};

Preproc.nObj = 1;
Preproc.obsDim = 7;
Preproc.R = LAG_LENGTH;
Preproc.windowSize = 9;
Preproc.channelNames = ChannelNames;

myFileList = dir(fullfile(DATA_DIR, '*.mat'));

data = SeqData();

fprintf('Reading %d files\n', length(myFileList));
for ii = 1:length(myFileList)
    fname = myFileList(ii).name;
    fpath = fullfile(DATA_DIR, fname);
    load(fpath, 'spatial');
    D = spatial.';
    D = bsxfun( @minus, D, mean(D,2) );
    D = preprocessMocapData(D, Preproc.windowSize );
    data = data.addSeq(D, fname);
end

saveSeqDataToPlainText( data, SAVE_DIR );
fprintf( '... saved to plain text in dir %s\n', SAVE_DIR );