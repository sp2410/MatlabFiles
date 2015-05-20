function [d2,e1,e2,e3,e4,e5,e6,d7,d8,d9,d10,d11,x,a,eul,compact,d3,d5,d6,me,st,ske,kur,ent,a1,a2,std,ske1,kur1]=imagefeature(k)
%calling the module4 functions for statistical measurements
[d2] = imagecon(k);
[e1,e2,e3,e4,e5,e6] = egdefeature(k);
[d7,d8,d9,d10,d11] = glcmfeature(k);
[x,a,eul,compact] = shapefeature( k );
[d3,d5,d6,me,st,ske,kur,ent] = texturefeature(k);
[a1] = imageinformation(k);
[a2,std,ske1,kur1] = spatialfeature(k);


%file handling
fid =fopen('mean.txt','W');
fid1=fopen('standard deviation.txt','W');
fid2 =fopen('skewness.txt','W');
fid3 =fopen('kurtosis.txt','W');
fid4 =fopen('entropy.txt','W');

fprintf(fid,'\t %12.8f \n',me);
fprintf(fid1,' \t %12.8f \n',st);
fprintf(fid2,'\t %12.8f \n',ske);
fprintf(fid3,'\t %12.8f \n',kur);
fprintf(fid4,'\t %12.8f \n',ent);
fclose(fid);
fclose(fid1);
fclose(fid2);
fclose(fid3);
fclose(fid4);
%glcm matrix
fid5 =fopen('glcm.txt','W');
fprintf(fid5,'\t %12.8f \n',d7);
fclose(fid5);
end

