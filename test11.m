function a=test11(image1)
imagefiles = dir('*.pgm');
nfiles = length(imagefiles);    
a=[];
for i=1:26
a[i] = imread('*.pgm');
end
end