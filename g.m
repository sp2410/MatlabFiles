function [a,b,c,d,e,g1,g2,g3,g4,g5,glcm]=callf(im)
%calling the module4 sunctions for statistical measurements
[a,b,c,d,e,g1,g2,g3,g4,g5] = module4(im);
glcm = graycomatrix(im);


%file handling
fid =fopen('mean.txt','W');
fid1=fopen('standard deviation.txt','W');
fid2 =fopen('skewness.txt','W');
fid3 =fopen('kurtosis.txt','W');
fid4 =fopen('entropy.txt','W');

fprintf(fid,'\t %12.8f \n',a);
fprintf(fid1,' \t %12.8f \n',b);
fprintf(fid2,'\t %12.8f \n',c);
fprintf(fid3,'\t %12.8f \n',d);
fprintf(fid4,'\t %12.8f \n',e);
fclose(fid);
fclose(fid1);
fclose(fid2);
fclose(fid3);
fclose(fid4);
%glcm matrix
fid5 =fopen('glcm.txt','W');
fprintf(fid5,'\t %12.8f \n',glcm);
fclose(fid5);

%edge detectn

figure(1),imshow(g1);
title('prewitt method edge detection');
figure(2),imshow(g2);
title('sobel method edge detection');
figure(3),imshow(g3);
title('LOG method edge detection');
figure(4),imshow(g4);
title('zerocross method edge detection');
figure(5),imshow(g5);
title('canny method edge detection');

end