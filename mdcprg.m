%functions 1. fun9.m
%          2. nearestneighbour.m
%          3. ordering.m
%          4. voting.m    
%fid=fopen('d:\kt','W');
%fid1=fopen('d:\kt_result','W');
%fid2=fopen('d:\kt_result_adaptive_k','W');
%I=imread('d:\dipankar\mathwork\Axil_85_MR-T1.jpg');I=rgb2gray(I);
% http://www.mathworks.com/products/image/demos.html?file=/products/demos/s
% hipping/images/ipexwatershed.html
tic;
t=cputime;
format long
global wr
global wc
global kt
global rd
global tempent;
global fid
global fid1
global once
global p
global akt
global ard
global ns
t1 = clock;
format short
fid=fopen('d:\kt','W');
fid1=fopen('d:\kt_result','W');
fid2=fopen('d:\kt_result_adaptive_k','W');
rd = .2;
once=1;
%fun2=inline('ordfilt2(A,1,ones(7,7),''symmetric'')');
%I = imread('liftingbody.png');

%I = phantom('Modified Shepp-Logan',256);
%For HMS image database
%**I=imread('d:\toolbox\dipankar\mathwork\Mrt2-029.jpg');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg=I;
%**Brain Tumor I=imread('d:\toolbox\dipankar\mathwork\BrainTumor.jpg');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg1=I;
%I=imread('d:\toolbox\dipankar\mathwork\MRGrd-29-TUMOR.jpg');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg1=I;
%I=imread('d:\toolbox\dipankar\alzheimerImagesMRT2\MRT2015.JPG');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg=I;
I=imread('d:\toolbox\dipankar\alzheimerImagesMRT2\MRT2014.JPG');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg=I;
%****I=imread('d:\toolbox\dipankar\mathwork\Axil_85_MR-T2.jpg');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg=I;
%I=imread('d:\toolbox\dipankar\mathwork\Axil_85_FDG.jpg');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg=I;
%I=imread('d:\toolbox\dipankar\mathwork\MR12.jpg');[m1 n1 o1]=size(I);Iorg=I;
%I=imread('d:\toolbox\dipankar\liverMRI\MRI-liver.jpg');[m1 n1 o1]=size(I);Iorg=I;
%**I=imread('d:\toolbox\dipankar\breastMRI\breast-mri.jpg');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg=I;
% Image from Radiology Associates of North Idaho database
% http://www.cdaradiology.com/feature_0511.htm
%I=imread('d:\toolbox\dipankar\breastMRI\BreastMRI2.jpg');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg1=I;
%**************************************************************************
%        SEGMENTATION USING WATERSHED TRANSFORMATION
%**************************************************************************
I=imread('d:\toolbox\dipankar\common\lena.tiff');[m1 n1 o1]=size(I);I=rgb2gray(I);Iorg1=I;
%**************************************************************************
%*******

figure;imshow(I);Iorg = I;
%**************************************************************************
%**************************************************************************



%For Vanderbilt Univ. RREP database
%I = rdmrt2();I=histeq(I);
min_o = round(min(I(:))); max_o = round(max(I(:)));
climo = [min_o  max_o];
%       I=imread('d:\BrainImg\Picture1.jpg');I=rgb2gray(I);
%       I=histeq(I);
%fun2=inline('imfilter(x,ones(5,5)/25)');
%fun2=inline('ordfilt2(A,1,ones(7,7),''symmetric'')');
%fun4=inline('fun3(A)');
figure(1)
%subplot(1,3,1);imshow(I);
%I2=imnoise(im2double(I),'gaussian',0,.001);  
%I2=ricepdf(im2double(I),0,1);
x = zeros(1,5);
y = zeros(1,5);
q = zeros(1,5);

imagesn= zeros(m1,n1,5);
imagesf = zeros(m1,n1,5);
imageWR = zeros(m1,n1,5);
imageWT = zeros(m1,n1,5);
p  = zeros(1,7);pw  = zeros(1,7);
akt = zeros(1,7);
ard = zeros(1,7);
%s = 10E-6; %10E-12; % Fot VU image data
s= 5; %10e-3;%5;
I2 = ricernd(double(I), s); % "Add" Rician noise (make Rician distributed)
%  I2=I2+~bw;
%I2 = mat2gray(double(I+I2));
I2 = mat2gray(I2);%histeq(I2);
min_r = round(min(I2(:))); max_r = round(max(I2(:)));
climr = [min_r  max_r];
%subplot(1,3,2);imshow(mat2gray(I2));
%I3=abs(imsubtract(double(I)./ 255, double(I2))); % for image with I needs
%I3=mat2gray(abs((double(I)./255) - double(I2))); 
%I3=mat2gray(double(I) - I2);
I3=mat2gray(double(I/max(max(I)))-I2);
%normalization
min_d = round(min(I3(:))); max_d = round(max(I3(:)));
climd = [min_d  max_d];
%subplot(1,3,3);imshow(mat2gray(I3));

%figure('Position', [30 500 800 300]);
%subplot(1,3,1);imagesc(I,climo);axis image;
%subplot(1,3,2);imagesc(I2,climr);axis image;
%subplot(1,3,3);imagesc(I3,climd);axis image;
subplot(1,3,1);imshow(I);axis image;xlabel('Original');
subplot(1,3,2);;imshow(I2);axis image;xlabel('Rician noise');%imshow(mat2gray(I2))
subplot(1,3,3);imshow(I3);axis image;xlabel('residual');%mat2gray(I3));
%figure(1)
figure(2)
subplot(1,3,1),imhist(double(I) ./ 255);axis([0 1 0 1600]);
xlabel('Original');
subplot(1,3,2),imhist(I2);xlabel('Rician noise');%mat2gray(I2);
subplot(1,3,3),imhist(I3);xlabel('residual'); %mat2gray(I3)
mse(I3);
mae(I3);
IX=I;
IY=I2;
I=I2;
                delta = .2;
                wr = 5;
                wc = 5;
                kt = ceil(wr*wc*.2);
                s= 5;
                kt_local=kt;
                
 for m = 1:3
                kt = kt_local;           
                I2 = ricernd(double(IX), s);ns = I2; %I2 = ricernd(double(I), s); ns = I2; % "Add" Rician noise (make Rician distributed)
                min_r = round(min(I2(:))); max_r = round(max(I2(:)));
                climr = [min_r  max_r];
                
                I3=mat2gray(double(IX/max(max(IX)))-I2);
                
                min_d = round(min(I3(:))); max_d = round(max(I3(:)));
                climd = [min_d  max_d];
                
                IY=IX;
                q(m,1)=s;q(m,2)=mean(mean(IY));q(m,3)=std(std(double(IY)));imagesn(:,:,m)=I2;
                IY=I2;
                
                %I2T = filter2(ones(3,3),I2);I2T=mat2gray(I2T);
                %I2T=wiener2(I2,[3 3]);
                I2T=I2;

            I2 =nlfilter(I2T,[wr wc],@fun9KSelection_entropy_mrt2x );
            %@fun9Kmedian%@fun9KSelection_entropy_mrt2 %@fun9KSelection); %@fuzzyc); %@fun9);%@fun9KSelection_Phantom_3

            IK=I2;
            %Store reduced noise image
            imagesf(:,:,m)=I2;
            %and its std deviation
            p(1,m)=std(std(I2));
            %and the value of k-nn
            akt(1,m)= kt;
            ard(1,m)=rd;



figure(70);
        
        subplot(1,3,1);imshow(Iorg);xlabel('(a)');title( 'Original Image ');
        subplot(1,3,2);imshow(mat2gray(IY));xlabel('(b)');title('Rician noise');
        subplot(1,3,3);imshow(mat2gray(I2));xlabel('(c)');title('Reduced noise (MDC)');
        I3=I-I2;
        mse(I3);
        mae(I3);

        figure(8)
        subplot(1,3,1),imhist(IX);
        subplot(1,3,2),imhist(I2);%imhist(mat2gray(I2));
        subplot(1,3,3),imhist(I3);%imhist(mat2gray(I3));



[IW noise]= wiener2(I2T,[wr wc]);
    x(1,m)=std(std(double(IX)));
    x(2,m)=std(std(IY));
    x(3,m)=std(std(I2));
    x(4,m)=std(std(I3));

    y(1,m)=std(std(double(IX)));
    y(2,m)=std(std(IY));
    y(3,m)=std(std(double(IW)));pw(1,m)=y(3,m);
    y(4,m)=std(std(double(IX)-double(IW)));
    x
    y
    imageWR(:,:,m)=IW;
      [thr,sorh,keepapp,crit] = ddencmp('den','wp',I2T)  
      xd = wdencmp('gbl',I2T,'sym4',2,thr,sorh,keepapp); 
    imageWT(:,:,m)=xd; 
      
      rd=.2;
      disp('No of iteration = ');
      m
     mdce=mse(I3);
     IWE=double(IY)-double(IX);%imsubtract(double(IY),double(IX));
     wfe=mse(IWE);
     fprintf(fid2,'%6d) %4d %4d %4d std_MDC:%8.5f mse_MDC:%8.5f std_wf:%8.5f mse_WF%8.5f  dif_dc_wf:%8.5f\n',m,wr,wc,kt,p(1,m),mdce,pw(1,m),wfe,abs(mdce-wfe));
     
    wr = wr + 2;
    wc = wc + 2;
    kt = ceil(wr*wc*.2);
    
   s = s * 10;
   
    ima=max(I2(:));
    imi=min(I2(:));
    %n = abs(Iorg(:)-I2(:));
    ims = std(I2T(:));
    n = I2T(:);
    snr_I2(m)=20*log10((ima-imi)./ims);
    snr_I22(m)=mean(I2(:))/std(n);
    mean_I2(m) = mean(I2(:));
    stdn_I2(m) = std(n);
    
    ima=max(IY(:));
    imi=min(IY(:));
    %n = abs(Iorg(:)-IY(:));
    ims = std(I2T(:));
    n = I2T(:);
    snr_IY(m)=20*log10((ima-imi)./ims);
    snr_IY2(m)=mean(IY(:))/std(n);
    mean_IY(m) = mean(IY(:));
    stdn_IY(m) = std(n);
    
    ima=max(IW(:));
    imi=min(IW(:));
     n = std(I2T(:));
    ims=n;
    %n = abs(Iorg(:)-IW(:));
    n = I2T(:);
    ims = std(I2T(:));
    snr_IW(m)=20*log10((ima-imi)./ims);
    snr_IW2(m)=mean(IW(:))/std(n);
    mean_IW(m) = mean(IW(:));
    stdn_IW(m) = std(n);
    
    ima=max(xd(:));
    imi=min(xd(:));
    n = std(I2T(:));
    
    %n = abs(Iorg(:)-xd(:));
    %ims=std(n);
    ims = std(I2T(:));
    n = I2T(:);
    snr_xd(m)=20*log10((ima-imi)./ims);
    snr_xd2(m)=mean(xd(:))/std(n);
    mean_xd(m) = mean(xd(:));
    stdn_xd(m) = std(n);
    %pause; 
end % of m loop   


%break
figure(19);
xx= zeros(256,256);
yy=zeros(256,256);
xx(1:m1,1:n1) = imagesn(:,:,m);
yy(1:m1,1:n1) = imagesf(:,:,m);
subplot(1,3,1);imshow(IX);title('Original');xlabel('(a)');
subplot(1,3,2);imshow(mat2gray(xx));title('Rician noise');xlabel('(b)');
%This line with mat2gray for non WF mathod
subplot(1,3,3);imshow(yy);title('Enhanced by MDC');xlabel('(c)');
%This line for WF mathod
%subplot(1,4,3);imshow(yy);title('Enhanced by DC');xlabel('(c)');
%subplot(1,4,4);imshow(IW);title('Enhanced by WF');xlabel('(d)');

figure(10)
xx= zeros(m1,n1);
yy=zeros(m1,n1);
xx(1:m1,1:n1) = imagesn(:,:,1);
yy(1:m1,1:n1) = imagesf(:,:,1);
subplot(1,3,1),imhist(double(IX)./ 255);title('Original');xlabel('(a)'); axis([0 1 0 1600]);
subplot(1,3,2),imhist(mat2gray(xx));title('Rician noise');xlabel('(b)');axis([0 1 0 1600])
subplot(1,3,3),imhist(mat2gray(yy));title('Enhanced by MDC');xlabel('(c)');axis([0 1 0 1600])
%subplot(1,4,4),imhist(double(IW));title('Enhanced by WF');xlabel('(d)'); axis([0 1 0 1600])
figure(11);

subplot(1,3,1);imshow(IX);title('Original');xlabel('(a)');
subplot(1,3,2);imshow(IY);title('Rician noise');xlabel('(b)');%imshow(mat2gray(IY))
subplot(1,3,3);imshow(IW);title('Wiener');xlabel('(c)');

figure(12);
subplot(1,3,1);imshow(IX);title('Original');xlabel('(a)');
subplot(1,3,2);imshow(IY);title('Rician noise');xlabel('(b)');
subplot(1,3,3);imshow(I2);title('MCD');xlabel('(c)');

figure(13);
subplot(1,3,1);imshow(IX);title('Original');xlabel('(a)');
subplot(1,3,2);imshow(IY);title('Rician noise');xlabel('(b)');
subplot(1,3,3);imshow(mat2gray(xd));title('WVT');xlabel('(c)')

figure(14);
subplot(2,2,1);imshow(IY);title('Rician noise');xlabel('(a)');
subplot(2,2,2);imshow(IW);title('Wiener');xlabel('(b)');
subplot(2,2,3);imshow(xd);title('Wavelet Trans.');xlabel('(c)')
subplot(2,2,4);imshow(I2);title('MDC');xlabel('(d)')

figure(15)
subplot(2,2,1);imhist(IX);title('Original');      xlabel('          (a)');axis([0 1 0 1000])
subplot(2,2,2);imhist(IW);title('Wiener');        xlabel('          (b)');axis([0 1 0 1000])
subplot(2,2,3);imhist(xd);title('Wavelet Trans.');xlabel('          (c)');axis([0 1 0 1000])
subplot(2,2,4);imhist(I2);title('MDC');           xlabel('          (d)');axis([0 1 0 1000])
figure(16)

subplot(1,3,1),imhist(double(IX) ./ 255);axis([0 1 0 2000]);title('Original');xlabel('(a)'); 
subplot(1,3,2);imhist(IY);axis([0 1 0 2000]);title('Rician noise');xlabel('(b)');%imhist(mat2gray(IY))
subplot(1,3,3),imhist(double(IW) ./ 255);axis([0 1 0 2000]);title('Enhanced & denoised image');xlabel('(c)');


figure(17)

subplot(1,2,1),imshow(IW);title('Enhanced & denoised image');xlabel('(a)');
subplot(1,2,2),imhist(double(IW) ./ 255);title('Enhanced & denoised histogram ');axis([0 1 0 2000]);xlabel('(b)');

figure(18)

subplot(1,3,1);imhist(IX);title('Original');xlabel('(a)'); axis([0 1 0 500])
subplot(1,3,2);imhist(IY);title('Rician noise');xlabel('(b)');axis([0 1 0 500]);%imhist(mat2gray(IY))
subplot(1,3,3);imhist(I2);title('Denoised image-MCD');xlabel('(c)');axis([0 1 0 500]);

IWE=imsubtract(double(IY),double(IX));
mse(I3)
mse(IWE)
mae(I3)
mae(IWE)
fclose(fid);
fclose(fid1);
fclose(fid2);
m


mm=mean(Iorg(:));snrm_2=mm/p(1,1);
snrm_1=mm/std(IY(:));

disp(snrm_1);
disp(snrm_2);

ima=max(I2(:));
imi=min(I2(:));
ims=std(I2(:));
%snr_I2=20*log10((ima-imi)./ims)

ima=max(IY(:));
imi=min(IY(:));
ims=std(IY(:));
%snr_IY=20*log10((ima-imi)./ims)

ima=max(IW(:));
imi=min(IW(:));
ims=std(IW(:));
%snr_IW=20*log10((ima-imi)./ims)





t2 = clock;
t2-t1
toc
cputime-t
%save D:\TOOLBOX\MFILES1\SAVEFILES\MRT2015_NOISE %dATED 01032011
save D:\TOOLBOX\MFILES1\SAVEFILES\MRT2014_NOISE %dATED 01032011
%save Axil_85_MR-T1_min#1 %This image has been enhanced by histogram equilization after creation
%save Axil_85_MR-T2_min#2 %This image has been enhanced by histogram equilization after creation
%save Axil_85_MR-T1_vote#1
%save Axil_85_FDG_#1
%save Mrt2-029_#1
%save Mrt2-029_vote#2
%save mr12_entropy_min#1
%save breastimage_entropy_max#1
%save breastimage_entropy_max#2
%save liverimage_entropy_min
%save liverimage_entropy_vote#1
%save  breastimage_entropy_BreastMRI2_min#3
%save  BrainTumor_entropy_min#1
%save  MRGrd-29-TUMOR_entropy_min#2
%IW2=double(f)-double(xd);snrw_1=mw/std(IW2(:))
%IW1=double(f)-g;snrw_1=mw/std(IW1(:))