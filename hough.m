function [h,theta,rho]= hough(f,dtheta,drho)
if nargin < 3
    drho = 1;
end
if nargin < 2
    dtheta = 1;
end
f=double(f);
[M,N] = size(f);
theta = linespace(-90,0,ceil(90/dtheta)+1);
theta = [theta-fliplr(theta(2:end-1))];
ntheta = length(theta);
end
