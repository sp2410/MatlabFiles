function output=denoiseBayes2D(noisy,type,no,level)

%##########################################################################
% This program denoises an image based on soft-thresholding wavelet
% coefficients using the BayesShrink threshold. Only the wavelet
% coefficients are thresholded.
% http://my.fit.edu/~kozaitis/Matlab/HomeMatlab.html
% Description of function, denoiseBayes2D.m
% 
% Usage:
% output=denoiseBayes2D(noisy,type,no,level)
%
% Input parameters: 
% noisy     An image with rows and columns that have a length that is a power of 2. 
% type      Type of wavelet; from the command "orthofil".
% no        Parameter of wavelet; from the command "orthofil".
% level     Number of levels of the wavelet transform used.
%
% Output parameters:
% output,   the denoised image.
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
% *************************************************************************


% Call the command wavetrans2D which calculates the 2rd-order coefficients.
[a WS]=wavetrans2D(noisy,type,no,level);


% Calculate sigma from smallest scale only (HH subband)
   %s=length(WS);
   [x y z]=size(WS);
   
  sigmaN=median(median(abs(WS(x/2+1:x,y/2+1:y))));
   
% Cycle through subbands in three sections HL, HH and LH.
%HH subbands
for l=1:level
    sigmaY=median(median(abs( WS((x/(2^l))+1:(x/(2^(l-1))),(y/(2^l))+1:(y/(2^(l-1)))) )));
    sigmaXP=max(((sigmaY^2)-(sigmaN^2)),0);
    
        if sigmaXP <= 0
            sigmaXP=0.000000001;
        end
    sigmaX=sqrt(sigmaXP);
    T=(sigmaN^2)/sigmaX;

    for k=(x/(2^l))+1:(x/(2^(l-1)))
        for kk=(y/(2^l))+1:(y/(2^(l-1)))
         % Soft-thresholding coefficients, 
  
         if WS(k,kk)>=T                % Values larger than the threshold
            WS(k,kk)=WS(k,kk)-T;        % soft thresholding          
         else
             if WS(k,kk)<=-T           % Values lower than the -|threshold|
                WS(k,kk)=WS(k,kk)+T;    % soft thresholding 
             else
                WS(k,kk)=0;             % Values between |threshold| and -|threshold|          
            end
         end
 
        end
    end    
end

%LH subbands
for l=1:level
    sigmaY=median(median(abs( WS((x/(2^l))+1:(x/(2^(l-1))),1:(y/(2^l)) ))));
    sigmaXP=max(((sigmaY^2)-(sigmaN^2)),0);
    
        if sigmaXP <= 0
            sigmaXP=0.000000001;
        end
    sigmaX=sqrt(sigmaXP);
    T=(sigmaN^2)/sigmaX;
    
    for k=(x/(2^l))+1:(x/(2^(l-1)))
        for kk=1:(y/(2^l))
         % Soft-thresholding coefficients, 
  
         if WS(k,kk)>=T                % Values larger than the threshold
            WS(k,kk)=WS(k,kk)-T;        % soft thresholding          
         else
             if WS(k,kk)<=-T           % Values lower than the -|threshold|
                WS(k,kk)=WS(k,kk)+T;    % soft thresholding 
             else
                WS(k,kk)=0;             % Values between |threshold| and -|threshold|          
            end
         end

        end
    end    

end

%HL subbands
for l=1:level

    sigmaY=median(median(abs( WS(1:(x/(2^l)),(y/(2^l))+1:(y/(2^(l-1))) ))));
    sigmaXP=max(((sigmaY^2)-(sigmaN^2)),0);
    
        if sigmaXP <= 0
            sigmaXP=0.000000001;
        end
    sigmaX=sqrt(sigmaXP);
    T=(sigmaN^2)/sigmaX;
    
    for k=1:(x/(2^l))
        for kk=(y/(2^l))+1:(y/(2^(l-1)))
         % Soft-thresholding coefficients, 
  
         if WS(k,kk)>=T                % Values larger than the threshold
            WS(k,kk)=WS(k,kk)-T;        % soft thresholding          
         else
             if WS(k,kk)<=-T           % Values lower than the -|threshold|
                WS(k,kk)=WS(k,kk)+T;    % soft thresholding 
             else
                WS(k,kk)=0;             % Values between |threshold| and -|threshold|          
            end
         end

        end
    end    

end
output=Iwavetrans2D(WS,type,no,level);
return




      



      
  
  