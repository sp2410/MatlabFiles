function [PSNR MSE er snr snr2 mssim issim en] =workweiner(k1)
p = double(k1);
p1 = 0.003;% p1 is a parameter(variance) to be used in  function noiseaddition
[g r] = noiseadditn(p1,p);

k=log2(1+k1);
[e en] = wiener2(r,[2 2]);
o=exp(e);
figure(1),imshow(mat2gray(o));
title('noise free image')

%figure(2),imhist(e);
%title('histogram of noise free image')

[PSNR,MSE] = PeakSignaltoNoiseRatio(o,r);

er=rms_error(o,r);

figure(3),imshow(r)
title('noised image')

%figure(4),imhist(e);
%title('histogram of noised image')

 n = abs((p(:)/255) - r(:));
 [snr snr2 mssim issim] = stats(mat2gray(o),r,n,p);


end