load guitar;
 % reshape to the multiple of 10 
realwave_10 = reshape(resample(realwave,240,243),24,10);   
realwave_mean = mean(realwave_10,2)';    % get the average period of realwave
temp = repmat(realwave_mean,1,10);      % replicate realwave_mean
generate_wave2proc = resample(temp,243,240);

% figure, plot(wave2proc),title('wave2proc');
% figure, plot(generate_wave2proc),title('generate_wave2proc');

% fft of full wave2proc
F_wave2proc = fft(wave2proc);
w = 8000 * (0:length(wave2proc)-1) / length(wave2proc);
% plot(w,F_wave2proc);
% [x,y] = ginput();

% replicate the signal in time domain
F_wave2proc_60 = fft(repmat(wave2proc,60,1));
w = 8000 * (0:length(F_wave2proc_60)-1) / length(F_wave2proc_60);
plot(w,F_wave2proc_60);
[x,y] = ginput();

