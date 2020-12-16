# Spatiotemporal dynamics of responses to biological motion in the human brain

The code in this repo was used for the generation and presentation of biological motion stimuli for the following work:
Chang, D. H. F., Troje, N. F., Ikegaya, Y., Fujita, I., & Ban, H. (in press).  Spatiotemporal dynamics of responses to biological motion in the human brain.  Cortex. [full doi will be updated once available]


## Getting Started and Usage

The top-level function is BMdirection(subjectname, runnum, runtype)

e.g., BMdirection('TEST', 1, 1)
subjectname looks for a subject-string identifier
runnum looks for a digit, denoting run iteration
runtype looks for a digit, here fixed as 1.  This was simply used
internally to separate this code from a variation that was earlier
piloted.


### Dependencies

Portions of this script tap on functions available in Psychtoolbox.  Instructions for installation of PTB can be found at http://psychtoolbox.org/.


## File list
#### BMdirection.m                 \\top-level function to initiate experiment
#### CreateDataFile.m              \\self explanatory...finalizes data structure, stamps date, and saves                                      
#### GenerateBlocks.m              \\defines stimulus type based on block ID, shuffles, outputs trial order.
#### CreateTrials.m		\\called by GenerateBlocks -- defines single trial parameters
#### PresentStimulus.m         	\\presents...the stimulus.
#### RunOneTrial.m                 \\runs a single trial    
#### RunTrials.m                   \\runs full trial loop             
#### create_windows.m              \\opens PTB windows                	
#### get_key.m                     \\prompts response pickup                                 
#### getdatatypes.m                \\called by RunTrials -- checks type of walker/stimulus data fed in.  Fourier series?  Time series data?
#### mdComputePositions.m          \computes the array of dots to draw at current frame.
#### mdPhaseScramble.m             \\called by mdprepare_single -- when called, this script takes time series data and phase-shuffles them.
#### mdSpatialScramble.m           \\called by mdprepare_single -- when called, this script takes an intact walker and performs a spatial reordering of walker point-lights
#### mdprepare_single.m            \\applies inversion, size, azimuth, 2D projection, centering, and scrambling as necessary               
#### shuffle.m                     \\for trial order randomization
#### walkerdata.mat       		\\data structure containing time-series data for each of the three main walker types



## Authors

* **Dorita CHANG**, **Hiroshi BAN**


## Acknowledgments

* Parts of this code are attributed to the BioMotionLab, biomotionlab.ca
