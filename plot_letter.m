function [ ] = plot_letter( )
% Displays two figures with images (undistorted and noisy) used for benchamrking of the HoloGN with HGN 
% 
%
% SYNOPSIS
%   plot_letter( )
%
% DESCRIPTION
%   Displays two figures with images (undistorted and noisy) used for benchamrking of the HoloGN with HGN 
%   complex values
%
%   Input:
%       There are no input parameters      
%
%   Output:
%       There is no output except two plots    
%           
% 
% AUTHOR
%   Denis Kleyko <denis.kleyko@ltu.se>
%
% VERSION
%   2015-04-23


%Provides set of images of letters. Fig. 4 in the original paper;
load Letters 

%Set a counter for subplots in figures
k=1;

figure('Name','Undistorted letters')
% Loop for 26 letters
for i=1:2 
for j=1:13
 
% Creates a subplot in Figure 1 with gray colormap    
subplot(2,13,k)    
colormap(gray);

%Plot a letter
imagesc(Letters{k,1});

%Set no axes to plot
set(gca,'xtick',[])
set(gca,'ytick',[])

%Increments the counter for subplots in figures
k=k+1; 
end
end

%Provides set of noisy images of letters. Fig. 5 in the original paper;
load Letters_noisy 

%Set a counter for subplots in figures
k=1;

figure('Name','Distorted letters, 5 bits')
% Loop for 26 letters
for i=1:2 
for j=1:13
 
% Creates a subplot in Figure 1 with gray colormap    
subplot(2,13,k)    
colormap(gray);

%Plot a letter
imagesc(Letters{k,1});

%Set no axes to plot
set(gca,'xtick',[])
set(gca,'ytick',[])

%Increments the counter for subplots in figures
k=k+1; 
end
end


end