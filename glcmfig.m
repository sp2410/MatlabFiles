function [g,a,b,c,d]=glcmfig(im)
g = graycomatrix(im);
a =  graycoprops(g,'contrast');
b = graycoprops(g,'correlation');
c = graycoprops(g,'energy');
d = graycoprops(g,'homogeneity');
end