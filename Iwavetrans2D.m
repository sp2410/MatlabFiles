% Iwavetrans2D.m
%
% This program calculates the 2-D inverse wavelet transform of an image using orthogonal filters. 
%
% Usage:
% Iwavetrans2D.m
% output=wavetrans2D(input,type,no,level)
%
% Input parameters: 
% input    Wavelet coefficients with length of rows and columns that are powerers of 2. 
% type     Type of wavelet; from the command "orthofil".
% no       Parameter of wavelet; from the command "orthofil".
% level    Number of levels of the wavelet transform used.
%
%
% Output parameters:
% output   Inverse wavelet transform.
%
% Currently, the maximum number of levels calculated is limited to five.
%
% The level of the transform is limited by the length of the filter
% generated from "type". The following equation must hold, length of filter >= log2 2^(N-level),
% where N is the length of the input vector. For example, if the filter is length 8, then the 
% last two largest scales(length 4, and length 2) will not calculated; no flag is given.
%
% The command orthofil has many low-pass filters associated with orthogonal 
% wavelet transforms. The high-pass filter is an alternating flipped 
% version of the low-pass filter.
%
%##########################################################################

function [output]=Iwavetrans2D(input, type, no, level)
[x y z]=size(input);

for i=1:x
 [FA output(i,1:y)]=Iwavetrans2(input(i,1:y),type,no,level);     
end

output=output';

for i=1:y
 [FA output(i,1:y)]=Iwavetrans2(output(i,1:y),type,no,level);     
end

output=output';



