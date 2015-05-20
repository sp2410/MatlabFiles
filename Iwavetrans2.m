function [FA,WS]=Iwavetrans2(signal,type,no,level)
%##########################################################################
% Calculates the 1-D inverse transform coefficientws and forward transform
% matrix.
%
% Input parameters: 
% signal     a row vector of length N that is a power of 2. 
% type       type of wavelet; from the command "orthofil".
% no         parameter of wavelet; from the command "orthofil".
% level      number of levels of the wavelet transform used.
%
% Output parameters:
% FA        inverse wavelet transform matrix, size N by N
% WS        inverse wavelet transform of input, row vector.
%
% Currently, the maximum number of levels calculated is limited to five.
%
% The level of the transform is limited by the length of the filter
% generated from "type". The following equation must hold, length of filter >= log2 2^(N-level),
% where N is the length of the input vector. For example, if the filter is length 8, then the 
% last two largest scales(length 4, and length 2) will not calculated; no flag is given.
%
% The command orthofil has many low-pass filters associated with orthogonal 
% wavelet transforms. The high-pass filter is an alternating flipped 
% version of the low-pass filter.
%
%##########################################################################

N=length(signal);
FA=zeros(N);
FW=zeros(N);
log2n=level;


LC=orthofil(type,no);
%--- Calcuate BC, the high-pass filter
BC=LC;
%---alternate signs of LC to produce BC
for v=1:length(BC),
	BC(v)=BC(v).*((-1)^(v));%Alternating Flip due to orthonarmal filter
end;
BC=fliplr(BC);
M=length(LC);
L=zeros(N);
B=zeros(N);

%--------------------------------------------------------------------------
%Making Wrap round filter matrices B and L.
%--------------------------------------------------------------------------
L=zeros(N);
for i1=M:-1:1,
	midL=eye(N).*LC(i1);
	midB=eye(N).*BC(i1);
	L=L+midL;
	B=B+midB;

	if(i1~=1),
		L=[L(N,:); L(1:N-1,:)];% Wrap round shift vertically...
		B=[B(N,:); B(1:N-1,:)];% Wrap round shift vertically...

	end;

end;
%--------------------------------------------------------------------------
% Make matrix L1. This matrix = [L/B] is the filtering at the finest scale
% which on the right of Eq. 1.42, p. 31 of
% "Wavelets and Filter Banks," by Strang and Nguyen.
%------------------------------------

L1=zeros(N);
for mm=1:N/2,
	L1(mm,:)=L(2*mm,:);
	L1((N/2)+mm,:)=B(2*mm,:);
end;

%--------------------------------------------------------------------------
% Initialize Analysis metrix A by using method of Eq. 1.42, p. 31 of
% "Wavelets and Filter Banks," by Strang and Nguyen. L1 is the matrix at
% the finest scale.
%--------------------------------------------------------------------------


L2=zeros(N);
	L2(1:N/4,:)      =L1(1:N/4,:);
	L2((N/4)+1:N/2,:)=L1((N/2)+1:(N/2)+(N/4),:);
	LL=zeros(N/2);
	LR=zeros(N/2);
	LL=L2(1:(N/2),1:(N/2));
	LR=L2(1:(N/2),(N/2)+1:N);
	LL=LL+LR;%L2
	L2=[LL zeros(N/2); zeros(N/2) eye(N/2)];


L3=zeros(N);
	L3(1:N/8,:)      =L2(1:N/8,:);
	L3((N/8)+1:N/4,:)=L2((N/4)+1:(N/4)+(N/8),:);
	LL=zeros(N/4);
	LR=zeros(N/4);
	LW=zeros(N/2);
	LL=L3(1:(N/4),1:(N/4));
	LR=L3(1:(N/4),(N/4)+1:N/2);
	LL=LL+LR;%L3
	LW=[LL zeros(N/4); zeros(N/4) eye(N/4)];
	L3=[LW zeros(N/2); zeros(N/2) eye(N/2)];


L4=zeros(N);
	L4(1:N/16,:)      =L3(1:N/16,:);
	L4((N/16)+1:N/8,:)=L3((N/8)+1:(N/8)+(N/16),:);
	LL=zeros(N/8);
	LR=zeros(N/8);
	LW=zeros(N/4);
	LX=zeros(N/2);
	LL=L4(1:(N/8),1:(N/8));
	LR=L4(1:(N/8),(N/8)+1:N/4);
	LL=LL+LR;
	LW=[LL zeros(N/8); zeros(N/8) eye(N/8)];
	LX=[LW zeros(N/4); zeros(N/4) eye(N/4)];
	L4=[LX zeros(N/2); zeros(N/2) eye(N/2)];


L5=zeros(N);
	L5(1:N/32,:)      =L4(1:N/32,:);
	L5((N/32)+1:N/16,:)=L4((N/16)+1:(N/16)+(N/32),:);
	LL=zeros(N/16);
	LR=zeros(N/16);
	LW=zeros(N/8);
	LX=zeros(N/4);
	LY=zeros(N/2);
	LL=L5(1:(N/16),1:(N/16));
	LR=L5(1:(N/16),(N/16)+1:N/8);
	LL=LL+LR;
	LW=[LL zeros(N/16); zeros(N/16) eye(N/16)];
	LX=[LW zeros(N/8) ; zeros(N/8)  eye(N/8)];
	LY=[LX zeros(N/4) ; zeros(N/4)  eye(N/4)];
	L5=[LY zeros(N/2) ; zeros(N/2)  eye(N/2)];


	if((M>N/2)|(level==1)),
%		disp('overload L2');
		FA=L1;
	elseif (((M>N/4)&(M<=N/2))|(level==2)),
%		disp('overload L3');
		FA=L2*L1;
	elseif (((M>N/8)&(M<=N/4))|(level==3)),
%		disp('overload L4');
		FA=L3*L2*L1;
	elseif (((M>N/16)&(M<=N/8))|(level==4)),
%		disp('overload L5');
		FA=L4*L3*L2*L1;
	elseif (((M>N/32)&(M<=N/16))|(level==5)),
%		disp('overload L6');
		FA=L5*L4*L3*L2*L1;
	else,
		disp('level should be in between 1 to 5');
	end;%if

WS=FA'*signal';
WS=WS';


