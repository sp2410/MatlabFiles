function [PSNR MSE er snr snr2 mssim issim] =workmed(k)
p = double(k);
%p1 = 0.003;% p1 is a parameter(variance) to be used in  function noiseaddition
%[g r] = noiseadditn(p1,p);
r= imnoise(p,'poisson');
e = medfilt2(r);
figure(1),imshow(e);
title('noise free image')

%figure(2),imhist(e);
%title('histogram of noise free image')
[PSNR,MSE] = PeakSignaltoNoiseRatio(e,r);

er=rms_error(e,r);

figure(3),imshow(r)
title('noised image')

%figure(4),imhist(e);
%title('histogram of noised image')


 n = abs((p(:)/255) - r(:));
 [snr snr2 mssim issim] = stats(e,r,n,p);

end