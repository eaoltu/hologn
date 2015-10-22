%This scenario corresponds to Fig. 8 in the paper.  Accuracy of HoloGN under the supervised learning memorization as
%a function of the number of presented examples for a given level of distortion.
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
    
    %Number of bit errors
    b=5; 
    
    %Creates vector with b errors
    Err=[ones(b,1); zeros(35-b,1)];
    
    %Number of GNs is determined as the number of pixels in the image
    numGN=size(Letters{1,1}(:),1);
    
    %Set the number of recalls
    Noisy_recall=100;
    
    %Set the maximal size of the training  set
    Bundle_limit=50;
    
    % Initialize cell array for storage of the training set
    BUNDLE=cell(26,1);
    
    %Initialize array to deploy results of simulation
    Accuracy_Noisy=zeros(3,Bundle_limit);
    
    %Do simulation for each size of the training set 
    for i=1:Bundle_limit
        % Initialize array for superposition of the training set
        HGN=zeros(26,d);
        
        %Initialize array to deploy results of recalls of noisy patterns
        Noise=zeros(Noisy_recall,26);
        
        %Encodes every image of letter
        for j=1:26 % number of letters
              rng('default');
              rng('shuffle');

              %Takes jth image from Letters  
              pict=Letters{j,1};

              %Reshapes image into pattern
              pattern(1,:)=pict(:)';  

              %Randomize error pattern
              Errn=Err(randperm(numGN));

              %Introduce distorions into image
              pattern_nois(1,:)=xor(pattern,Errn');                

              %Creates distributed representation for a noisy pattern
              repr=hologn_encoder(pattern_nois)';              

              %Add representation of a noisy pattetn into training set
              BUNDLE{j,1}(end+1,:)=repr;  

              %Create superposition of training set through majority sum
              %operation
              HGN(j,:)=majority_sum(BUNDLE{j,1});
        end

        %Perform recall of noisy pattern on trained representations 
        %recall is done Noisy_recall times
        for k=1:Noisy_recall
            %Display current step in simulation
            disp([i,j,k]);
            
            %Encodes every image of letter
            for j=1:26 % number of letters
                rng('default');
                rng('shuffle');
                
                %Takes jth image from Letters                 
                pict=Letters{j,1};

                %Reshapes image into pattern
                pattern(1,:)=pict(:)';  
                
                %Randomize error pattern
                Errn=Err(randperm(numGN));

                %Introduce distorions into image
                pattern_nois(1,:)=xor(pattern,Errn');                

                %Creates distributed representation for a noisy pattern
                repr=hologn_encoder(pattern_nois)';                                
                
                %Recall the closest letter from the item memory which contains
                %distributed represetnations extracted from the training set (HGN here)
                Noise(k,j)=item_memory_c(bin2com(repr), bin2com(HGN) );                
            end            

        end

        %Calculate the percentage of average accuracy for noisy recall of every
        %letter for every size of training set
        Succ_rate=zeros(1,26);
        for j=1:26
        Succ_rate(1,j)=(sum((Noise(:,j)==j))/Noisy_recall)*100;
        end
        
        %Calculate the percentage of average accuracy for noisy recall for
        %every size of training set along with maximum and minumum
        %accuracires between letters
        %Note that plot in Fig. 8. in the paper displays Accuracy_Noisy(1,:) 
        Accuracy_Noisy(1,i)=mean(Succ_rate);
        Accuracy_Noisy(2,i)=max(Succ_rate);
        Accuracy_Noisy(3,i)=min(Succ_rate);


    end
    
    
    
    
    
    
    
