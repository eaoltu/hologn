%This scenario corresponds to Fig. 6 in the paper. Results from testing black and white images of letters using recall patterns with distortions ranging from 2.9 % to 14.3 % .
%           
% 
% AUTHOR
%   Denis Kleyko <denis.kleyko@ltu.se>
%
% VERSION
%   2015-04-23

clear all

%Provides set of images of letters. Fig. 4 in the original paper;
load Letters 

%Set the dimensionality of HD-vectors
d=10000;

%Set number of simulations for each noise level.
sim=1000;

%Number of GNs is determined as the number of pixels in the image
numGN=size(Letters{1,1}(:),1);

%Creates distributed representation (HGN) for every undistorted image of
%letter via call to "letters_encoding" function
HGN=letters_encoding(  );

%Complex array for later recall
HGNc=bin2com(HGN);

%Initialize array to deploy results of accuracy calculation
Accuracy=zeros(5,26);

%b is the number of bit errors. Range from 1 to 5
for b=1:5

   %Creates vector with b errors
   Err=[ones(b,1); zeros(numGN-b,1)];
   
       
   %Initialize array to deploy results of recalls
   Noisy=zeros(sim,26); 
   

   
   %Encodes every image of letter
   for j=1:26
        %Display current step in simulation
        disp([b,j]); 
       
        %Takes jth image from Letters  
        pict=Letters{j,1};

        %Reshapes image into pattern
        pattern(1,:)=pict(:)';   
        
        %Perform sim simulations for each noise level
        for k=1:sim
            rng('default');
            rng('shuffle')
            
            %Randomize error pattern
            Errn=Err(randperm(numGN));
            
            %Introduce distorions into image
            pattern_nois(1,:)=xor(pattern,Errn');
                        
            %Creates distributed representation for a noisy pattern
            repr=hologn_encoder(pattern_nois)';
            
            %Recall the closest letter from the item memory which contains
            %distributed represetnations for undistorted letters (HGNc here)
            Noisy(k,j)=item_memory_c(bin2com(repr), HGNc );
        end
       
   end
   
   %Calculate the percentage of average accuracy for noisy recall of every
   %letter for every level of distorsion
   %Note that every plot in Fig. 6. in the paper displays Accuracy(i,:), 
   %where i is the number of distorted bits  
    for i=1:26
	Accuracy(b,i)=(sum((Noisy(:,i)==i))/sim)*100;
    end

   
   
   
end