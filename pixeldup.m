function b = pixeldup(a,m,n)
% b = pixeldup(a,m,n) duplicates each pixel of a  m times in the vertical
% direction and n times in the horizontal direction.
%parameters m and n must be integers.If n is not includedd, it 
%defaluts to m

%check inputs
if nargin<2
    error('at least two inputs are required');
end
if nargin ==2
    n=m;
end
%generate a vector with elements 1:size(a,1).
u = 1:size(a,1);
%duplicate each element of the vector m times.
m = round(m);%protect against nonintegers.
u = u(ones(1,m),:);
u = u(:);
%now repeat for the other direction
v = 1:size(a,2);
n=round(n);
v = v(ones(1,n),:);
v=v(:);
b=a(u,v);
end