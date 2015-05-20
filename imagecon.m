function [d1,d2] = imagecon(k)
%conversion of rgb image into black & white image %
d1=im2bw(k);
%conversion of rgb image into gray matrix image %
d2=rgb2gray(k);
%display of images%
figure(1),imshow(k);
title('original image');
figure(2),imshow(d1);
title('black & white image');
figure(3),imshow(d2);
title('RGB2GRAY image');
end

