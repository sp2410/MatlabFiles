function [ d7,d8,d9,d10,d11 ] = glcmfeature(k)
m=rgb2gray(k);
%graycomatrix — Computes the gray-level co-occurrence matrix from an image%
d7 = graycomatrix(m);
%graycoprops — Extracts properties from a gray-level co-occurrence matrix%
%calculation of contrast, homogeneity, coorelation & energy of image%
d8 = graycoprops(d7,'contrast');
d9=graycoprops(d7,'homogeneity');
d10 = graycoprops(d7,'correlation');
d11= graycoprops(d7,'energy');
end

