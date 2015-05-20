function [nc, g8] =wavezero(c,s,l,wname)
[nc, foo] = wavecut('h',c,s,l);
[nc, foo] = wavecut('v',nc,s,l);
[nc, foo] = wavecut('d',nc,s,l);
i = waveback(nc,s,wname);
g8 = im2uint8(mat2gray(i));
figure; imshow(g8);