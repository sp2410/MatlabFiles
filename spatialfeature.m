function [a,std,ske,kur] = spatialfeature(k)
d2=rgb2gray(k);
y=histeq(d2);

figure(12),imhist(d2);
title('histogram image');
figure(13),imhist(y);
title('histogram_equilize RGB2GRAY image');


x=imhist(d2);
x1=x(1:10:256);
b=1:10:256;
figure(18),bar(b,x1);
title('bar graph of gray image');
figure(19),stem(b,x1);
title('stem graph of gray image');
figure(20),plot(b,x1);
title('plot graph of gray image');

%Mean of image
a=mean2(k);
%Standard deviation
std=std2(k);
%Skewness is a measure of the asymmetry of the data around the sample mean.
%If skewness is negative, the data are spread out more to the left of the mean than to the right. 
%If skewness is positive, the data are spread out more to the right. 
%The skewness of the normal distribution (or any perfectly symmetric distribution) is zero. 
ske1=skewness(im2double(k))*255;
ske2=skewness(im2double(ske1))*255;
ske=skewness(im2double(ske2))*255;
%Kurtosis is a measure of how outlier-prone a distribution is.
kur1=kurtosis(im2double(k))*255;
kur2=kurtosis(im2double(kur1))*255;
kur=kurtosis(im2double(kur2))*255;
end

