function [snr_g snr2_g snr_w snr2_w snr_m snr2_m mssim_g mssim_w mssim_m issim_g issim_w issim_m snr_wl snr2_wl mssim_wl issim_wl y x y1 x1 x2 y2] = plotting(s_i1,q_i1,d,g,n,o,p)
[snr_g snr2_g mssim_g issim_g] = stats(s_i1,g,n,p);
[snr_w snr2_w mssim_w issim_w] = stats(q_i1,g,n,p);
[snr_m snr2_m mssim_m issim_m]= stats(d,g,n,p);
[snr_wl snr2_wl mssim_wl issim_wl] = stats(o,g,n,p);

x=[snr_g snr_w snr_m snr_wl];
y = [1 2 3 4];
%title('SNRs of log method on each noise removal method')
x1 = [snr2_g snr2_w snr2_m snr_wl];
y1 = [1 2 3 4];
%%title('SNRs of mean/std method on each noise removal method');
x2 = [mssim_g mssim_w mssim_m mssim_w];
y2 = [1 2 3 4];
%
%x3 = [ max(max(issim_g)) max(max(issim_w)) max(max(issim_g))];
%y3 = [1 2 3];
end