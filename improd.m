function[p,pmax,pmin,pn]= improd(f,g)
fd = double(f);
gd=double(g);
p = fd.*gd;
pmax = max(p(:));
pmin = min(p(:));
pn = mat2gray(p);
