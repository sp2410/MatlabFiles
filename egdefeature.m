function [e1,e2,e3,e4,e5,e6] = egdefeature(k)
d=rgb2gray(k);
%contour of image
imcontour(d,3);
%edge detection of gray matrix image with sobel operator%
e1 = edge(d,'sobel');
%edge detection of gray matrix image with prewitt operator%
e2 = edge(d,'prewitt');
%edge detection of gray matrix image with robert operator%
e3 = edge(d,'robert');
%edge detection of gray matrix image with log operator%
e4 = edge(d,'log');
%edge detection of gray matrix image with canny operator%
e5 = edge(d,'canny');
%edge detection of gray matrix image with zerocross operator%
e6 = edge(d,'zerocross');

figure(1),imshow(e1);
title('sobel operator applied');
figure(2),imshow(e2),
title('prewitt opertaor applied');
figure(3),imshow(e3),
title('robert opertaor applied');
figure(4),imshow(e4),
title('log opertaor applied');
figure(5),imshow(e5),
title('canny opertaor applied');
figure(6),imshow(e6),
title('zerocross opertaor applied');
end

