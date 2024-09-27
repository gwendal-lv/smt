% RUN SOUND MORPHING TOOLBOX

% Original data : ONLY 44.1 kHz works!!!
% 16kHz : does NOT work! sounds are definitely too low... even when
% loading original 16kHz audio, and computing a 16kHz morphing
% Same for 48kHz: pitched too high
fs = 44100;  % WARNING : must be 44.1 kHz... can't explain why
dataDir = 'C:/Users/Gwendal/Documents/MATLAB/smt/audio/multi_fs';  % must contain a start.wav and an end.wav
n_steps = 7;  % must be < 10 (1 digit)

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADD FOLDER FROM CURRENTLY RUNNING SCRIPT TO MATLAB PATH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get full path & name of executing file
exeFile = mfilename('fullpath');
% Get full path of executing directory
exeDir = fileparts(exeFile);
% If EXEDIR is not on the path
if ~tools.iofun.isdironpath(exeDir)
    % Add EXEDIR (and all subfolders) to Matlab path
    tools.iofun.add2path(exeDir);
end
% Create environment variable SM with the absolute path to the base folder
setenv('SMT',exeDir);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Absolute path of audio file
sourcePath = fullfile(dataDir, 'organ_short_44100Hz.wav');  % Warning: SMT reverses start and end... (source and target)
% Absolute path of audio file
targetPath = fullfile(dataDir, 'lead_short_44100Hz.wav');

% Morphing factors
morphFactors = 0.0:(1/(n_steps-1)):1.0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RUN SMT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% retrieve MULTIPLE files - in a cell array
multi_audio = smt(sourcePath,targetPath,morphFactors);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SAVE SOUNDS - directly in the original dataDir
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:length(morphFactors) 
    morph = multi_audio{i};
    file_name = ['morph_step' num2str(i - 1) '.wav'];
    audiowrite(fullfile(dataDir, file_name), morph, fs);
end

