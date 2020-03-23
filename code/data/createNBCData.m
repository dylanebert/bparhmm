function [] = createNBCData(DATA_DIR)

myFileList = dir(fullfile(DATA_DIR, '*.mat'));

Preproc.R = 1;
Preproc.windowSize = 9;

data = SeqData();

fprintf('Reading %d files\n', length(myFileList));
for ii = 1:length(myFileList)
    fname = myFileList(ii).name;
    fpath = fullfile(DATA_DIR, fname);
    load(fpath);
    D = x.';
    D = bsxfun( @minus, D, mean(D,2) );
    D = preprocessMocapData(D, Preproc.windowSize );
    data = data.addSeq(D, fname);
end

saveSeqDataToPlainText( data, DATA_DIR );
fprintf( '... saved to plain text in dir %s\n', DATA_DIR );