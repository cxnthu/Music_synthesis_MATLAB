function [f,w,N] = fft_plot(signal)
% input:
% signal: type: 1*n matrix.
% 
% output:
% f: fft of signal;
% w: corresponding frequency. 
% picture of the fft of x
w = 8000 * (0:length(signal)-1) / length(signal);
f = abs(fft(signal));
N = length(signal);
subplot(2,1,1);plot(signal(1:floor(length(signal)/100)));
subplot(2,1,2);plot(w,f);
end
