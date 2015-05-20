function [snr_g snr2_g snr_w snr2_w snr_m snr2_m en] = try2(image,noise,type,no,level)
tic;
tstart = tic;
%This function try2 takes an image and by using other functions
% like-  stats(for statistical calculations),filters(for filtering by many
% types of filters),noiseaddition(to add noise)
k=rgb2gray(image);%this is the noised image taking as the one on which all the operations gnna be performd
p = double(k);
p1 = 0.003;% p1 is a parameter(variance) to be used in  function noiseaddition
[g r] = noiseadditn(p1,p);% the function is called by giving the parameters
%f = orthofil('Daubechies',no);

if strcmp(noise,'gaussian'),
n = abs((p(:)/255) - g(:));% n is a parameter to be used in  function stats
[s_i1 q_i1 en d o] = filters(g,type,no,level);% the function is being called nd output is being stored in a array
[snr_g snr2_g snr_w snr2_w snr_m snr2_m mssim_g mssim_w mssim_m issim_g issim_w issim_m snr_wl snr2_wl mssim_wl issim_wl y x y1 x1 x2 y2] = plotting(s_i1,q_i1,d,g,n,o,p);
subplot(221);imshow(mat2gray(s_i1));
%subpolt(142);imshow(mat2gray(s_i2));
subplot(222);imshow(mat2gray(q_i1));
subplot(223);imshow(mat2gray(d));
%figure,subplot(121);imshow(mat2gray(g));
subplot(224);imshow(mat2gray(o));
figure(2),imshow(mat2gray(g));
figure(3),plot(y,x);
title('SNRs of log method on each noise removal method');
figure(4),plot(y1,x1);
title('SNRs of mean/std method on each noise removal method');
figure(5),plot(y2,x2);
en %estimated noise from wiener filter
snr_g 
snr2_g
snr_w 
snr2_w 
snr_m
snr2_m
mssim_g
mssim_w
mssim_m

%file handling
fid =fopen('snr values1.txt','W');
fid1=fopen('snr values2.txt','W');
fid2 =fopen('ssim values.txt','W');
fprintf(fid,'snr values using log method \n %12.8f %12.8f %12.8f',snr_g,snr_w,snr_m);
fprintf(fid1,'snr values using mean/std method \n %12.8f %12.8f %12.8f\n',snr2_g,snr2_w,snr2_m);
fprintf(fid2,'ssim values \n %12.8f %12.8f %12.8f\n',mssim_g,mssim_w,mssim_m);
fclose(fid);
fclose(fid1);
fclose(fid2);
telapsed = toc(tstart);
telapsed
end

if strcmp(noise,'rician'),
 n = abs((p(:)/255) - r(:));% n is a parameter to be used in  function stats
[s_i1 q_i1 en d o] = filters(r,type,no,level);% the function is being called nd output is being stored in a array
[snr_g snr2_g snr_w snr2_w snr_m snr2_m mssim_g mssim_w mssim_m issim_g issim_w issim_m snr_wl snr2_wl mssim_wl issim_wl y x y1 x1 x2 y2] = plotting(s_i1,q_i1,d,r,n,o,p);
subplot(221);imshow(mat2gray(s_i1));
%subpolt(142);imshow(mat2gray(s_i2));
subplot(222);imshow(mat2gray(q_i1));
subplot(223);imshow(mat2gray(d));
%figure,subplot(121);imshow(mat2gray(g));
subplot(224);imshow(mat2gray(o));
figure(2),imshow(mat2gray(r));
figure(3),plot(y,x);
title('SNRs of log method on each noise removal method');
figure(4),plot(y1,x1);
title('SNRs of mean/std method on each noise removal method');
figure(5),plot(y2,x2);
en %estimated noise from wiener filter
snr_g 
snr2_g
snr_w 
snr2_w 
snr_m
snr2_m
mssim_g
mssim_w
mssim_m
%r
%s
%file handling
fid =fopen('snr values1.txt','W');
fid1=fopen('snr values2.txt','W');
fid2 =fopen('ssim values.txt','W');
fprintf(fid,'snr values using log method \n %12.8f %12.8f %12.8f',snr_g,snr_w,snr_m);
fprintf(fid1,'snr values using mean/std method \n %12.8f %12.8f %12.8f\n',snr2_g,snr2_w,snr2_m);
fprintf(fid2,'ssim values \n %12.8f %12.8f %12.8f\n',mssim_g,mssim_w,mssim_m);
fclose(fid);
fclose(fid1);
fclose(fid2);
telapsed = toc(tstart);
telapsed
end

end



