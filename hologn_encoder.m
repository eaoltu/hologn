function [HGN] = hologn_encoder(GNs)
% Creates distributed representation for a pattern across graph neurons 
% 
%
% SYNOPSIS
%   HGN = hologn_encoder(GNs)
%
% DESCRIPTION
%   Creates distributed representation for a pattern across graph neurons 
%   
%   Input:
%       GNs  pattern to be represented by HoloGN
%              
%
%   Output:
%       HGN holographic representation of the activated elements   
%           
% 
% AUTHOR
%   Denis Kleyko <denis.kleyko@ltu.se>
%
% VERSION
%   2015-04-23

%

%Set the dimensionality of HD-vectors
d=10000;

%Number of GNs is determined by the legnth of the input pattern
numGN=size(GNs,2);

%Initialize an array of initialization high-dimensional vectors for every GN
%Note that one of parameters is seed, i.e. if the seed remains the same, then the
%generated HD-vectors will be the same as well
IV=randint(numGN,d,[0,1],1);


%An array for shifted initialization HD-vectors
E=[]; 

%For every GN shift initialization HD-vectors in the value activated in the GN
for i=1:numGN
E(end+1,:)=circshift(IV(i,:), [0 GNs(1,i)]);   
end

%Create HGN representation by majority sum on E
HGN=majority_sum(E);


end

