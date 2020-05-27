function BMdirection(subjectname, runnum, runtype)

%e.g., BMdirection('TEST', 1, 1)
 
%runtypes:  9 IdealCutting/BMLscramble/Modifiedscramble  x   Upright/Inverted

logfname=fullfile(fileparts(mfilename('fullpath')),'Data',sprintf('%s_BMdirection_%d_%d.log',subjectname,runnum,runtype));
diary(logfname);

%% INITIALIZATION

load walkerdata.mat;

nd = 0; %place holder; for scrambled mask, change mmultiply; for linear mask, change in pptwalk
dotsize=6;%6;
leng=0.5;
iti=3.0; % this will actually be used to wait for fixed response period.  Currently essentially the isi.
trans=0;
mix=0;
mmultiply = 1; % takes care of number scrambled walkers in mask. Linear mask (if used) currently set at 1*nwalkerdots
fc=[1 1];
clc

%% GENERATE TEST TRIALS

% % Create trials
% if runtype == 1
%     blocks = Shuffle([2 4 5 7 2 4 5 7 2 4 5 7]);
% elseif runtype == 2
%     blocks = Shuffle([5 7 6 8 5 7 6 8 5 7 6 8]);
% end

% Create trials

%blocks = shuffle([2 4 5 7 6 8]);
blocks = [2 4 5 7 6 8];
alltrials = GenerateBlocks(blocks);

% %MODIFIED BY HB% zero padding for the latter processing...not so sophisticated...
for ii=1:1:length(alltrials), alltrials{ii}(:,size(alltrials{ii},2)+1:size(alltrials{ii},2)+5)=0; end

% %MODIFIED BY HB% randomize the trial order completely in a run, but please be careful...not so sophisticated...
tmp_randtrials=1:length(alltrials)*size(alltrials{1},1);
tmp_randtrials=shuffle(tmp_randtrials);
[I,J]=ind2sub([length(alltrials),size(alltrials{1},1)],tmp_randtrials);
for ii=1:1:numel(unique(I)), J(I==ii)=1:numel(find(I==ii)); end
randtrials=([I;J])'; % randtrials=[randomized_block,randomized_trial]
clear tmp_randtrials I J;

% %MODIFIED BY HB% We are using this script at MEG room, so I will omit the codes to select the presentation start method
% Check if we're at the scanner or in the lab
% valid=0; 
% while (valid==0);
%     user_entry = input('Are we at the Scanner? (y/n)', 's');
%     if(user_entry == 'y')
%         disp('We are scanning!');
%         pause(1);
%         test = 0;
%         valid=1;
%     elseif (user_entry == 'n')
        disp('In the MEG');
        pause(1);
        %test = 1;
        test = 2; % %MODIFIED BY HB% % changed the test ID
%         valid=1;
%     else
%         disp('Press y or n!');
%         finish;
%     end    
% end

% Run trials
% %MODIFIED BY HB% randomize the trial order completely in a run, but please be careful...not so sophisticated...
fprintf('\nStimulus presentation started...\n');
alltrials = RunTrials(alltrials, walkerdata, iti, trans, fc, mmultiply, nd, dotsize, leng, test, randtrials);

% Prep Data File
% %MODIFIED BY HB% record the randomized trial order...not so sophisticated...
Dat.SubjectID = subjectname;
Dat.BlockCond = blocks;
Dat.RunType = runtype;
Dat.RunNum = runnum;
Dat.Trials = alltrials;
Dat.TrialOrder = randtrials; % this parameter holds the actual stimulus presentation order in MEG
Dat.StimulusDuration = leng;
Dat.StimulusDistance = 46; %cm %% please change accordingly

err = CreateDataFile(Dat);

clear trials
diary off;
