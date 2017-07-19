load guitar;
wave2proc = repmat(wave2proc,1000,1);
fft_plot(wave2proc);

x = [];
y = [];
for i = 1 : 4
    [tx,ty] = ginput(1);
    x = [x,tx];
    y = [y,ty];
end