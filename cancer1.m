function [mask bwfim bwfim0 bwfim1] = cancer1(k,lvlotsu,classkm)

[mu,mask]=kmeans1(k,classkm);
figure(1);imshow(mat2gray(mask));
title(sprintf('class=%f',classkm));


fim=mat2gray(k);
level=graythresh(fim);
bwfim=im2bw(fim,lvlotsu);
figure(2),imshow(bwfim);
title(sprintf('Otsu,level=%f',level));


[bwfim0,level0]=fcmthresh(fim,0);
[bwfim1,level1]=fcmthresh(fim,1);

figure(3),imshow(bwfim0);
title(sprintf('FCM0,level=%f',level0));

figure(4),imshow(bwfim1);
title(sprintf('FCM1,level=%f',level1));





end