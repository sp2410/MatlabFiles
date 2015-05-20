function [varargout] = wavework(opcode, type, c, s, n, x)
error(nargchk(4,6,nargin));
if(ndims(c)~=2)||(size(c,1)~=1)
    error('c msut be a row vector.');
end
if(ndims(s)~=2)||~isreal(s)||~isnumeric(s)||(size(s,2)~=2)
    error('s must be a real ,numeric two-column array');
end
elements=prod(s,2);
if(length(c)<elements(end))||~(elements(1) + 3*sum(elements(2:end-1))>=elements(end))
    error('[c s] must form a standard wavelet decomposition structure');
end
if nargin < 5
    n=1;
end
nmax = size(s,1)-2;
aflag = (lower(type(1))=='a');
if ~aflag &&(n>nmax)
    error('n exceeds the decomposition in [c,s].');
end
switch lower(type(1))
    case 'a'
        nindex = 1;
        start=1;  stop = elements(1);  ntst=nmax;
    case{'h','v','d'}
        switch type
            case 'h', offset = 0;
            case 'v',offset = 1;
            case'd',offset = 2;
        end
        nindex=size(s,1)-n;
        start=elements(1)+3*sum(elements(2:nmax-n+1))+offset*elements(nindex)+1;
        stop = start+elements(nindex)-1;
        ntst=n;
    otherwise
        error('type must begin with "a","h","v",or "d".');
end
switch lower(opcode)
    case{'copy','cut'}
        y= repmat(0,s(nindex,:));
        y(:) = c(start:stop);   nc = c;
        if strcmpi(opcode(1:3),'cut')
            nc(start:stop)=0;varargout = {nc,y};
        else
            varargout = {y};
        end
    case 'paste'
        if prod(size(x)) ~=elements(end-ntst)
            error('x is not sized for the requested paste.');
        else
            nc=c; nc(start:stop)=x(:);   varargout = {nc};
        end
    otherwise
        error('unrecognized opcode');
end
