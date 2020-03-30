function Preproc = getDataPreprocInfo( dataName, dataParams )
% Obtain struct of "preprocess" parameters 
%  these indicate how to create/transform raw data
%  into desired format to be processed by the given time series model
% When adding a new dataset, be sure to EDIT THIS FILE

MocapChannelNames = {'root.ty', 'lowerback.rx', 'lowerback.ry', 'upperneck.ry', ...
                     'rhumerus.rz', 'rradius.rx','lhumerus.rz', 'lradius.rx', ...
                     'rtibia.rx', 'rfoot.rx', 'ltibia.rx', 'lfoot.rx'...    
                    };
NBCChannelNames = {'pos.x', 'pos.y', 'pos.z', 'rot.x', 'rot.y', 'rot.z', 'rot.w'};
                
% =============================================== DEFAULT PARAMS
PP = struct(); 
switch lower(dataName)
    % ----------------------------------------------------- Synth Data
    case {'synth', 'synthmultinomial', 'synthdiscrete'}
        PP.nObj = 50;
        PP.T = 100;
        PP.nStates = 10;
        PP.V = 1000; % # vocabulary symbols
        PP.obsDim = -5;
        PP.pEmitFavor = 0.9; % prob. state emits symbol from its favored set
    case {'synthgaussian', 'synthnormal'}
        PP.nObj = 50;
        PP.T = 100;
        PP.nStates = 8;
        PP.obsDim = 5;
    case {'synthar'}
        PP.nObj = 50;
        PP.T = 100;
        PP.nStates = 8;
        PP.obsDim = 2;
        PP.R = 1;   
    % ----------------------------------------------------- Motion Capture
    case {'mocap6'}
        PP.nObj = 6;
        PP.obsDim = 12;
        PP.R = 1;
        PP.windowSize = 12;
        PP.channelNames = MocapChannelNames;  
    case {'mocapbig'}
        PP.nObj = 124;
        PP.obsDim = 12;
        PP.R = 1;
        PP.windowSize = 12;
        PP.channelNames = MocapChannelNames;  
    case {'nbc_10hz'}
        PP.nObj = 1;
        PP.obsDim = 7;
        PP.R = 3;
        PP.windowSize = 9;
        PP.channelNames = NBCChannelNames;
    case {'nbc_5hz'}
        PP.nObj = 1;
        PP.obsDim = 7;
        PP.R = 3;
        PP.windowSize = 18;
        PP.channelNames = NBCChannelNames;
    case {'nbc_1hz'}
        PP.nObj = 1;
        PP.obsDim = 7;
        PP.R = 3;
        PP.windowSize = 90;
        PP.channelNames = NBCChannelNames;
end

% =============================================== UPDATE WITH USER INPUT
Preproc = updateParamsWithUserInput( PP, dataParams );
