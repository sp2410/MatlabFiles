function[ratio, maxdiff] = ifwtcompare(f,n,wname)
[c1, s1] = wavedec2(f,n,wname);
tic;
g1 = waverec2(c1,s1,wname);
reftime = toc;
[c2, s2] = wavefast(f,n,wname);
tic;
g2 = waveback(c2,s2,wname);
t2 = toc;
ratio = t2/(reftime+eps);
maxdiff = abs(max(max(g1-g2)));
