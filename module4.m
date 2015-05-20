function [me,st,ske,kur,ent,g1,g2,g3,g4,g5,g6,he] = module4(image)
% This function will calculate the values of mean,standard
% deviation,skewness,kurtosis,and entropy of a given image,the user 
% has to give the  image as the calling input and the output will be
% me=mean,st=standard deviation,ske=skewness,kur=kurtosis,ent=entropy.
me=mean(image);
st=std(im2double(image))*255;
ske=skewness(im2double(image))*255;
kur=kurtosis(im2double(image))*255;
ent = entropy(image);
%spatial feature:histogram equalisation
he = histeq(image);

%edge detection
g1=edge(image,'prewitt');
g2=edge(image,'sobel');
g3=edge(image,'LOG');
g4=edge(image,'zerocross');
g5=edge(image,'canny');
g6=edge(image,'robert');


end