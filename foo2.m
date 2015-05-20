function [out] = foo2(m)
%call this function after chosing the segmented image from foo1
%m is a the segmented image chosen by the user
%This function is called after the result of segmentation is chosen by the
%user.
%choise specifies the  segmented image after running foo1 function and
%chosing the best result.
%This function gives the estimates of paprmeters and it is saved in a
%vector called out.
%  The various parameters chosen are:
%Autoc : Autocorrelation
%contr : Contrast
%corm : Correlation Matlab
%corrp : Correlation [1, 2]
%cprom : Cluster Prominence
%cshad : Cluster Shade
%dissi : Dissimilarity
%energy : Energy
%entro : Entropy
%homom : Homogeneity Matlab
%homop : Homogeneity [2]
%maxpr : Maximum Probability
%sosvh : Sum of Squares Variance
%savgh : Sum Average
%svarh : Sum Variance
%senth : Sum Entropy
%dvarh : Difference Variance
%denth : Difference Entropy
%inf1h : Information Measure of Correlation 1
%inf2h : Information Measure of Correlation 2
%Indnc : Inverse Difference Normalized (INN)
%Idmnc : Inverse Difference Moment Normalized



w=mat2gray(m);
e=roipoly(mat2gray(w));
m=(mat2gray(m).*e);
imshow(m);
glcm=graycomatrix(m);
[out] = GLCM_Features1(glcm);
save('out');



end