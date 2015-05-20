function [ratio, maxdiff] = fwtcompare(f,n,wname)
tic;
[c1, s1] = wavedec2(f,n,wname);
reftime = toc;
tic;
[c2,s2]=wavefast(f,n,wname);
t2 = toc;
ratio =t2(reftime+eps);
maxdiff=abs(max(c1-c2));
