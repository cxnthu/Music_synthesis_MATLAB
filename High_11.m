data = audioread('fmt.wav');
L = length(data);
freq = [];
for i = -1 : 6
    freq = [freq,Note2Frequency('F',i)];
end
map = containers.Map(freq,-1:6);

% find harmonic
[f,w] = fft_plot(data);
s = 8000 / L;
result = [];
for i = 1 : length(freq)
    start = round((freq(i)-5)/s);
    over = round((freq(i)+5)/s);
    m0 = max(f(start:end));
    if m0 > max(f) * 0.5
        j = 2;
        tem = struct('note',map(freq(i)),'amp',[1]);
        while round((freq(i)*j+5)/s) <= L/2
            start = round((freq(i)*j-5*j)/s);
            over = round((freq(i)*j+5*j)/s);
            m = max(f(start:over));
            if m >= m0 * 0.1
                tem.amp = [tem.amp,m/m0];
            else
                tem.amp = [tem.amp,0];
            end
            j = j + 1;
        end
        result = [result,tem];
    end
end
dong_fang_hong = [struct('note',5,'beats',1),
    struct('note',5,'beats',0.5),
    struct('note',6,'beats',0.5),
    struct('note',2,'beats',2),
    struct('note',1,'beats',1),
    struct('note',1,'beats',0.5),
    struct('note',-1,'beats',0.5),
    struct('note',2,'beats',2)];
% add to dong_fang_hong
for i = 1 : length(dong_fang_hong)
    dong_fang_hong(i).amp = result(dong_fang_hong(i).note+2).amp;
end
wrap3 = [0.05,0.4,0.5,0.8];        % guitar
sound(Generate_Song2(dong_fang_hong,140,8000,'sin','F',wrap3),8000);

            
            
                          
                    
                                      
                    
                    