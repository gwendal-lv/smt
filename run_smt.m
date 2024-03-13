% RUN SOUND MORPHING TOOLBOX

% Original data
fs = 16000;  % WARNING : must correspond to the original sounds' fs
original_base_dir = 'audio/interp9_test/00007';
n_steps = 9;  % MUST be < 10 (1 digit)

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
setenv('SMT',exeDir)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUT PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Absolute path of audio file (using EXEDIR)
sourcePath = fullfile(exeDir,original_base_dir, 'audio_step00.wav');
% Absolute path of audio file (using EXEDIR)
%targetPath = fullfile(exeDir,original_base_dir, 'audio_step08.wav');
targetPath = fullfile(exeDir,original_base_dir, ['audio_step0' num2str(n_steps - 1) '.wav']);

% Morphing factors
morphFactors = 0.0:(1/(n_steps-1)):1.0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RUN SMT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% retrieve MULTIPLE files - in a cell array
multi_audio = smt(sourcePath,targetPath,morphFactors);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTEN TO SOUNDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:length(morphFactors) 
    morph = multi_audio{i};
    file_name = ['morph_step' num2str(i) '.wav'];
    audiowrite(fullfile(exeDir,'audio/dev',file_name), morph, fs);
end

% Play MORPH
%sound(morph,fs)
