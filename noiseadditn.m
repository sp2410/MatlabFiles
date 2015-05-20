function [g r]   = noiseadditn(p1,p)
%here p1 is varince,p is the original image,g is noised image,r is rician
%noise.
g= imnoise(p,'gaussian',0,p1);
l =  ricernd(double(p), 5);
r = mat2gray(l);
end