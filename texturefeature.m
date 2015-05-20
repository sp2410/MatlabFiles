function [d3,d5,d6,me,st,ske,kur,ent] = texturefeature(k)
%stdfilt — Calculates the standard deviation of an image%
d3=stdfilt(k);
%rangefilt — Calculates the local range of an image%
d4=rangefilt(k);
%entropy — Calculates the entropy of an intensity image%
d5=entropy(k);
%entropyfilt — Calculates the local entropy of an intensity image%
d6=entropyfilt(k);
me=mean(k);
st=std(im2double(k))*255;
%S = SKEWNESS(X) returns the sample skewness of the values in X.  
%For a vector input, S is the third central moment of X, divided by the cube of its standard deviation.  
%For a matrix input, S is a row vector containing the sample skewness of each column of X.  
%For N-D arrays, SKEWNESS operates along the first non-singleton dimension.
ske=skewness(im2double(k))*255;
%K = KURTOSIS(X) returns the sample kurtosis of the values in X.  
%For a vector input, K is the fourth central moment of X, divided by fourth power of its standard deviation.  
%For a matrix input, K is a row vector containing the sample kurtosis of each column of X.  
%For N-D arrays, KURTOSIS operates along the first non-singleton dimension.
kur=kurtosis(im2double(k))*255;
ent = entropy(k);
figure(4),imshow(d4);
title('local range of image');
end

