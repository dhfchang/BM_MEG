function alltrials=RunTrials(alltrials, data, iti, trans, fc, mmultiply, nd, dotsize, leng, test, randtrials);

%
% PARAMETERS
prompt = ' <- | -> '; %Text prompt after each trial

rand('state',sum(100*clock));                               %Initialise the random generator

%Set input variable defaults if necessary
if fc==0; fc=[0 0]; end
%trials(find(trials(:,22)==0),22)=3;                         %Dot size
if fc(1) > iti; fc(1)=iti; end
if length(trans)==1; trans=[trans trans]; end;              %If trans=scalar, generalizes it to an (x,y) pair



%Get data types
datatypes=getdatatypes(data);

%Disable all the lines of warning (usually irrelevant) outputted by Screen.
%oldEnableMode = Screen('Preference', 'SuppressAllWarnings', 1);

%Open window and create colour shortcuts
[window, colour]=create_windows;

%Set font and size
Screen('TextFont',window,'Courier New');
Screen('TextSize',window,40);

%Get window centre

% %MODIFIED BY HB% % Enabled stimulus presentation with dual screen setting
%windowsize=Screen('Rect',0);                                % window-coordinates, e.g. [0 0 1024 768]
windowsize=Screen('Rect',max(Screen('Screens')));

xcenter=round(windowsize(3)/2);                             % center of window
ycenter=round(windowsize(4)/2);


nwd = 0;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Trigger:
% DC @ MNI
% We are using USB box and waiting for a '5' - ie , use GetChar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %MODIFIED BY HB% unify key names across different operating systems
KbName('UnifyKeyNames');

% %MODIFIED BY HB% changed the trigger key code
Trigger1 = 32;  %'space' % space is 32 in Windows with a Japanese keyboard, not 44
Trigger2 = 13; %'return'
%Trigger3 = 84; %'t'
is_true = 0;

if (test)

    if strcmp(computer, 'PCWIN64')
        while (is_true == 0)
            [keyIsDown,junk4,keyCode] = KbCheck;
            if keyCode(Trigger1) || keyCode(Trigger2)
                is_true = 1;
            end
        end
    else

        while GetChar~= 'Space';
        end
    end

else  %we're at scanner

    if strcmp(computer, 'PCWIN64')
        Trigger3 = KbName('t');
        while (is_true == 0)

            [a,b,keyCode] = KbCheck;
            if keyCode(Trigger3)
                is_true = 1;
            end

        end
        FlushEvents('keyDown')
    else
        while GetChar~= 't';
        end
    end
end
%%

Screen('Preference', 'VisualDebuglevel', 3); %HB%

starttime = GetSecs;
%start by fixating

%Display the fixation cross
Screen('Drawline',window, colour.grey, xcenter, ycenter-10, xcenter, ycenter+10);
Screen('Drawline',window, colour.grey, xcenter-10, ycenter, xcenter+10, ycenter);
Screen('flip',window);

% %MODIFIED BY HB% just wait for 2 sec at the beginning will be fine.
%WaitSecs(16);
WaitSecs(2);

ntrials_block = 10;
% %MODIFIED BY HB% randomize the trial order completely in a run, but please be careful...not so sophisticated...
%for a = 1:length(alltrials); %loop through blocks
for a = 1:size(randtrials,1); %loop through the randomized blocks/trials

    %trials = alltrials{a};
    trial = alltrials{randtrials(a,1)}(randtrials(a,2),:);
    fprintf('Stimulus type: %02d [#trials %03d] (%03d/%03d)...',randtrials(a,1),randtrials(a,2),a,size(randtrials,1));

    blockstarttime = GetSecs;
    %blockendtime = blockstarttime + 16 + (5.2*ntrials_block);

    % %MODIFIED BY HB% % add the ITI jittering in the RunOneTrial function
    %blockendtime = blockstarttime + (5.2*ntrials_block);

    %for i=1:size(trials,1);                                     %Loops through trials - one row in 'trials' for each trial

        % %MODIFIED BY HB% randomize the trial order completely in a run, but please be careful...not so sophisticated...
        %trialResponses(i,:) = RunOneTrial(trials(i,:), data, iti, trans, fc, ...
        %    datatypes, nwd, window, colour, prompt, xcenter, ycenter, mmultiply, nd, dotsize, leng, test);

        trialResponses = RunOneTrial(trial, data, iti, trans, fc, ...
            datatypes, nwd, window, colour, prompt, xcenter, ycenter, mmultiply, nd, dotsize, leng, test);
        %WaitSecs(iti-fc(1));                                    %Wait for next trial, allowing time for fixation cross if selected
    %end;
    %trials = trialResponses;
    %alltrials{a} = trialResponses;
    fprintf('%.3f sec\n',GetSecs-blockstarttime);

    alltrials{randtrials(a,1)}(randtrials(a,2),:) = trialResponses;

    % %MODIFIED BY HB% % add the ITI jittering in the RunOneTrial function, so we do not need the lines below
    % %pause and fixate
    % %Display the fixation cross
    % Screen('Drawline',window, colour.white, xcenter, ycenter-10, xcenter, ycenter+10);
    % Screen('Drawline',window, colour.white, xcenter-10, ycenter, xcenter+10, ycenter);
    % Screen('flip',window);

    % %MODIFIED BY HB% % add the ITI jittering in the RunOneTrial function, so we do not need the lines below
    %if GetSecs < blockendtime
    %    while GetSecs < blockendtime
    %        %wait it out
    %    end
    %end
end

%insert final fixation
%Display the fixation cross
Screen('Drawline',window, colour.white, xcenter, ycenter-10, xcenter, ycenter+10);
Screen('Drawline',window, colour.white, xcenter-10, ycenter, xcenter+10, ycenter);
Screen('flip',window);

% %MODIFIED BY HB% just wait for 4 sec at the end will be fine.
WaitSecs(1);

endtime = GetSecs;
totaltime = endtime-starttime
%save totaltime totaltime
Screen('CloseAll')
%Screen('Preference', 'SuppressAllWarnings', oldEnableMode);
