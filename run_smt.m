% RUN SOUND MORPHING TOOLBOX

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
sourcePath = fullfile(exeDir,'audio/dev','clavinet_C3_f_4s.wav');

% Absolute path of audio file (using EXEDIR)
targetPath = fullfile(exeDir,'audio/dev','organ_mustard_060_085_4s.wav');

% Morphing factor
morphFactor = 0.5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RUN SMT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

morph = smt(sourcePath,targetPath,morphFactor);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LISTEN TO SOUNDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sampling rate
fs = 44100;
audiowrite(fullfile(exeDir,'audio','morph_4s.wav'),morph,fs)

% Play MORPH
sound(morph,fs)
