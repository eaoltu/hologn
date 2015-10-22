function [ decoded ] = item_memory_c(vector, memory )
% Recall the closest vector in item-memory and outputs corresponding index
%
% SYNOPSIS
%   decoded = item_memory_c(vector, memory)
%
% DESCRIPTION
%   Recall the closest vector in item-memory and outputs corresponding
%   value.
%
%   Input:
%       vector  vector to be recalled
%       memory  item memory of HoloGN       
%       Please note that inputs are assumed to be arrays of complex numbers with
%       possible values 0 or j
%
%   Output:
%       decoded index in memory, which HD-vector has the smallest Hamming   
%           distance with the input vector
% 
% AUTHOR
%   Denis Kleyko <denis.kleyko@ltu.se>
%
% VERSION
%   2015-04-23

    % Hamming distances between the input and the values in item-memory
    HD=imag(memory*vector);
    
    % Index of the closest vector in item memory
    [v,decoded]=min(HD);


end

