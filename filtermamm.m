function [n1,n2,n3,en]= filtermamm(p)
%noise removal
n1=  mat2gray(denoiseBayes2D(single(p),'Daubechies',4,3));
[n2 en] =wiener2(p,[2 2]);
 n3 = medfilt2(p);
end