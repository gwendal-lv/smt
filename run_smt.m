% RUN SOUND MORPHING TOOLBOX

% Original data : ONLY 44.1 kHz works!!!
% 16kHz : does NOT work! sounds are definitely too low... even when
% loading original 16kHz audio, and computing a 16kHz morphing
% Same for 48kHz: pitched too high
fs = 44100;  % WARNING : must be 44.1 kHz... can't explain why
%original_base_dir = 'audio/interp9_test/00007';
n_steps = 9;  % must be < 10 (1 digit)

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
% Absolute path of audio file (using EXEDIR)
sourcePath = fullfile(exeDir,original_base_dir, 'audio_step00.wav');
sourcePath = fullfile(exeDir, 'audio/multi_fs', 'organ_short_44100Hz.wav');
% Absolute path of audio file (using EXEDIR)
%targetPath = fullfile(exeDir,original_base_dir, 'audio_step08.wav');
targetPath = fullfile(exeDir,original_base_dir, ['audio_step0' num2str(n_steps - 1) '.wav']);
targetPath = fullfile(exeDir, 'audio/multi_fs', 'lead_short_44100Hz.wav');

% Morphing factors
morphFactors = 0.0:(1/(n_steps-1)):1.0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RUN SMT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% retrieve MULTIPLE files - in a cell array
multi_audio = smt(sourcePath,targetPath,morphFactors);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SAVE SOUNDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:length(morphFactors) 
    morph = multi_audio{i};
    file_name = ['morph_step' num2str(i - 1) '.wav'];
    audiowrite(fullfile('Z:/seq_temp', file_name), morph, fs);
end

