function [e1,e2,e3,e4,e5,e6,e7,e8,e9] = work(p)
%e1=[];e2=[];e3=[];


%noise removalmodule
[n1,n2,n3,en]= filtermamm(p);

%image enhancement module:
e1=histeq(n1);
e2=imadjust(n1);
e3=adapthisteq(n1);


e4=histeq(n2);
e5=imadjust(n2);
e6=adapthisteq(n2);

e7=histeq(n3);
e8=imadjust(n3);
e9=adapthisteq(n3);





 
end