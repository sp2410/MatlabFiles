function training = trainin(x,y)
%k is a string for directory
training=[];
imagefiles = dir('*.pgm');
nfiles = length(imagefiles);    
for ii=1:nfiles
    currentfilename = imagefiles(ii).name;
    I = imread(currentfilename);
    BW=im2bw(I,graythresh(I)); 
    temp = reshape(BW,1,y);
    training(ii,:)=temp;
end



end