

function [output] =wavetrans2D(input,type, no, level)
[x y z]=size(input);

for i=1:x
 [FA output(i,1:y)]=wavetrans2(input(i,1:y),type,no,level);     
end

output=output';

for i=1:y
 [FA output(i,1:y)]=wavetrans2(output(i,1:y),type,no,level);     
end

output=output';



