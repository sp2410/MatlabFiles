%load  MRGrd-29-TUMOR_entropy_min#2 
%load   breastimage_entropy_max#2
%load liverimage_entropy_vote#1
%load  Mrt2-029_vote#2
%load Axil_85_MR-T1_vote#1
load D:\TOOLBOX\MFILES1\SAVEFILES\MRT2015_NOISE
    
%  SNR 20*LOG(MAX-MIN)/STD(NOISY_IMAGE)

    figure(30)
    
    snr_I2(m)=20*log10((ima-imi)./ims);
    snr_I22(m)=mean(I2(:))/std(I2T(:));
    %x  = [.0001,.001,.01];
    x  = [.015,.001,.05];
    y=snr_I2;
    cs=spline(x,[0 y 0]);
    %xx =linspace(.0001,.01,101);
    xx =linspace(.015,.05,25);
    plot(xx,ppval(cs,xx),'r-');
    
    snr_IY(m)=20*log10((ima-imi)./ims);
    snr_IY2(m)=mean(IY(:))/std(I2T(:));
    y=snr_IY;
    cs=spline(x,[0 y 0]);
    %xx =linspace(.0001,.01,101);
    xx =linspace(.015,.05,25);
    hold on;% plot(xx,ppval(cs,xx),'y-');
    
    snr_IW(m)=20*log10((ima-imi)./ims);
    snr_IW2(m)=mean(IW(:))/std(I2T(:));
    
    y=snr_IW;
    cs=spline(x,[0 y 0]);
    %xx =linspace(.0001,.01,101);
    xx =linspace(.015,.05,25);
    plot(xx,ppval(cs,xx),'b-');
    
    snr_xd(m)=20*log10((ima-imi)./ims);
    snr_xd2(m)=mean(xd(:))/std(I2T(:));
    
    y=snr_xd;
    cs=spline(x,[0 y 0]);
    %xx =linspace(.0001,.01,101);
    xx =linspace(.015,.05,25);
    plot(xx,ppval(cs,xx),'g-');
    
    %***********************SNR MEAN(DENOISED_IMAGE)/STD(NOISE_IMAGE)*********************
    figure(31)
    %x  = [.0001,.001,.05];
    x  = [.015,.001,.05];
    y=20*log10(snr_I22);
    cs=spline(x,[0 y 0]);
    %xx =linspace(.0001,.05,25);
    xx =linspace(.015,.05,25);
    plot(xx,ppval(cs,xx),'r-');
    xlabel('noise');
    ylabel('SNR');
    legend('MDC');
    
    figure(32)
    y=20*log10(snr_IY2);
    cs=spline(x,[0 y 0]);
    %xx =linspace(.0001,.05,25);
    xx =linspace(.015,.05,25);
    %hold on; plot(xx,ppval(cs,xx),'y-');
    
    y=20*log10(snr_IW2);
    cs=spline(x,[0 y 0]);
    %xx =linspace(.0001,.05,25);
    xx =linspace(.015,.05,25);
    hold on;plot(xx,ppval(cs,xx),'b-');
    
    y=20*log10(snr_xd2);
    cs=spline(x,[0 y 0]);
    %xx =linspace(.0001,.05,25);
    xx =linspace(.015,.05,25);
    plot(xx,ppval(cs,xx),'g-');
    xlabel('noise');
    ylabel('SNR');
    legend('Winear','Wavelet')
    % MEAN
    figure(33)
    y=mean_I2;
    cs=spline(x,[0 y 0]);
    xx =linspace(.0001,.01,101);
    plot(xx,ppval(cs,xx),'r-');
    
    y=mean_IY;
    cs=spline(x,[0 y 0]);
    xx =linspace(.0001,.01,101);
    hold on; plot(xx,ppval(cs,xx),'y-');
    
    y=mean_IW;
    cs=spline(x,[0 y 0]);
    xx =linspace(.0001,.01,101);
    plot(xx,ppval(cs,xx),'b-');
    
    y=mean_xd;
    cs=spline(x,[0 y 0]);
    xx =linspace(.0001,.01,101);
    plot(xx,ppval(cs,xx),'g-'); 
    % STD 
    figure(34)
    y=std(I2(:));
    cs=spline(x,[0 y 0]);
    xx =linspace(.0001,.01,101);
    plot(xx,ppval(cs,xx),'r-');
    
    y=std(IY(:));
    cs=spline(x,[0 y 0]);
    xx =linspace(.0001,.01,101);
    hold on; plot(xx,ppval(cs,xx),'y-');
    
    y=std(IW(:));
    cs=spline(x,[0 y 0]);
    xx =linspace(.0001,.01,101);
    plot(xx,ppval(cs,xx),'b-');
    
    y=std(xd(:));
    cs=spline(x,[0 y 0]);
    xx =linspace(.0001,.01,101);
    plot(xx,ppval(cs,xx),'g-'); 