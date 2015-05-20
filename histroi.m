function [p, npix] = histroi(f,c,r)
B = roipoly(f,c,r);
p = imhist