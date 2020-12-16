function [trialsout] = GenerateBlocks(blocks)
%Define block contents.

for k = 1:length(blocks)
    
    j = blocks(k);
    
    switch j
        
         case 1
            
            
            %% block 1 %natural, coherent, upright
            rep = 4;
            
            walkerindex = [1]; %natural 1, modified 2, cutting 3
            walkerdir = [90 -90];
            walkerori = [0]; %upright 0, inverted 1, 5 -->, 6 <---
            walkercoh = [0]; %coherent 0, scrambled 2
            masktype = [0]; %fixed -1, nomask 0, linear 1, scrambled 2
            maskdir = [-1]; %fixed -1,
            maskori = [-1]; %fixed -1, upright 0, inverted 1, 5 -->, 6 <---
            maskcoh = [-1]; %coherent 0, scrambled 2
            
            
        case 2
            %% block 2 %Cutting, coherent, upright
            rep = 5;
            
            walkerindex = [3]; %natural 1, modified 2, cutting 3
            walkerdir = [90 -90];
            walkerori = [0]; %upright 0, inverted 1, 5 -->, 6 <---
            walkercoh = [0]; %coherent 0, scrambled 2
            masktype = [0]; %fixed -1, nomask 0, linear 1, scrambled 2
            maskdir = [-1]; %fixed -1,
            maskori = [-1]; %fixed -1, upright 0, inverted 1, 5 -->, 6 <---
            maskcoh = [-1]; %coherent 0, scrambled 2
            
        case 3
            %% block 3 %natural, coherent, inverted
            rep = 4;
            
            walkerindex = [1]; %natural 1, modified 2, cutting 3
            walkerdir = [90 -90];
            walkerori = [1]; %upright 0, inverted 1, 5 -->, 6 <---
            walkercoh = [0]; %coherent 0, scrambled 2
            masktype = [0]; %fixed -1, nomask 0, linear 1, scrambled 2
            maskdir = [-1]; %fixed -1,
            maskori = [-1]; %fixed -1, upright 0, inverted 1, 5 -->, 6 <---
            maskcoh = [-1]; %coherent 0, scrambled 2
            
        case 4
            %% block 4 %Cutting, coherent, inverted
            rep = 5;
            
            walkerindex = [3]; %natural 1, modified 2, cutting 3
            walkerdir = [90 -90];
            walkerori = [1]; %upright 0, inverted 1, 5 -->, 6 <---
            walkercoh = [0]; %coherent 0, scrambled 2
            masktype = [0]; %fixed -1, nomask 0, linear 1, scrambled 2
            maskdir = [-1]; %fixed -1,
            maskori = [-1]; %fixed -1, upright 0, inverted 1, 5 -->, 6 <---
            maskcoh = [-1]; %coherent 0, scrambled 2
            
        case 5
            %% block 5 %natural, scrambled, upright
            rep = 5;
            
            walkerindex = [1]; %natural 1, modified 2, cutting 3
            walkerdir = [90 -90];
            walkerori = [0]; %upright 0, inverted 1, 5 -->, 6 <---
            walkercoh = [2]; %coherent 0, scrambled 2
            masktype = [0]; %fixed -1, nomask 0, linear 1, scrambled 2
            maskdir = [-1]; %fixed -1,
            maskori = [-1]; %fixed -1, upright 0, inverted 1, 5 -->, 6 <---
            maskcoh = [-1]; %coherent 0, scrambled 2
            
        case 6
            %% block 6 %modified, scrambled, upright
            rep = 5;
            
            walkerindex = [2]; %natural 1, modified 2, cutting 3
            walkerdir = [90 -90];
            walkerori = [0]; %upright 0, inverted 1, 5 -->, 6 <---
            walkercoh = [2]; %coherent 0, scrambled 2
            masktype = [0]; %fixed -1, nomask 0, linear 1, scrambled 2
            maskdir = [-1]; %fixed -1,
            maskori = [-1]; %fixed -1, upright 0, inverted 1, 5 -->, 6 <---
            maskcoh = [-1]; %coherent 0, scrambled 2
            
        case 7
            %% block 7 %natural, scrambled, inverted
            rep = 5;
            
            walkerindex = [1]; %natural 1, modified 2, cutting 3
            walkerdir = [90 -90];
            walkerori = [1]; %upright 0, inverted 1, 5 -->, 6 <---
            walkercoh = [2]; %coherent 0, scrambled 2
            masktype = [0]; %fixed -1, nomask 0, linear 1, scrambled 2
            maskdir = [-1]; %fixed -1,
            maskori = [-1]; %fixed -1, upright 0, inverted 1, 5 -->, 6 <---
            maskcoh = [-1]; %coherent 0, scrambled 2
            
        case 8
            %% block 8 %modified, scrambled, inverted
            rep = 5;
            
            walkerindex = [2]; %natural 1, modified 2, cutting 3
            walkerdir = [90 -90];
            walkerori = [1]; %upright 0, inverted 1, 5 -->, 6 <---
            walkercoh = [2]; %coherent 0, scrambled 2
            masktype = [0]; %fixed -1, nomask 0, linear 1, scrambled 2
            maskdir = [-1]; %fixed -1,
            maskori = [-1]; %fixed -1, upright 0, inverted 1, 5 -->, 6 <---
            maskcoh = [-1]; %coherent 0, scrambled 2
            
   
    end
    trialsout{k} = CreateTrials(walkerindex, walkerdir, walkerori, walkercoh, masktype, maskdir, maskori, maskcoh, rep);
    

end

