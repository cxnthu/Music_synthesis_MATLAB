% read data
data = audioread('fmt.wav');
L = length(data);

% split note
step = 6;
P_former = 0;
index_former = -1000;
ratio = 1.8;
interval = 100;
min_note = 0.12;
id = [];
for i = 1 : step : L - step
    [P,index] = max(data(i:i+step));
    index = index + i - 1;
    if P>ratio*P_former & index>index_former+interval & P>min_note
        id = [id,index];
        index_former = index;
    end
    P_former = P;
end
% cluster
neighbour = 1200;
id = cluster(neighbour,id,data);
% filter to minimize notes left
lid = 0;
interval_note = 1900;       
while(lid ~= length(id))
    lid = length(id);
    flag = 1;
    note_num = 32;
    amp = data(id(1));
    while(flag+1 <= length(id))
        if amp > data(id(flag+1)) & id(flag+1)-id(flag)<interval_note
            amp = data(id(flag + 1));
            id(flag + 1) = [];
        else
            flag = flag + 1;
            amp = data(id(flag));
        end
    end
end

% get the beats of each note
beats = [];
for i = 1 : length(id) - 1
    beats = [beats,id(i+1)-id(i)];
end
beats = [beats,length(data)-id(end)]/8000;
id = [id,length(data)]; 

%collect baseband
limit = 0.003;
amp_limit = 0.43;
cluster_limit = 10;
baseband = [];
for k = 1 : length(id) - 1
    [F,w,N] = fft_plot(repmat(data(id(k):id(k+1)),100,1));  % replicate 100 times
    % get frequency large enough
    F = F(1:floor(end/2));
    f = find(F>max(F)*amp_limit)*8000/N;
    f = f(f>120 & f<800);
    f = cluster(cluster_limit,f);
    % remove multiply of baseband
    temp = struct('note',[],'amp',[]);
    for i = 1 : length(f)
        flag = 1;
        for j = 1 : length(temp.note)
            ratio = f(i) / temp.note(j);
            if ratio>=round(ratio)*(1-limit) & ratio<=round(ratio)*(1+limit)
                flag = 0;
                break;
            end
        end
        if(flag)
            temp.note = [temp.note,f(i)];
            temp.amp = [temp.amp,F(round(f(i)*N/8000))];
        end
    end
    temp.amp = temp.amp / max(temp.amp);
    baseband = [baseband;temp];
end

[song,bpm] = Frequency2Note(baseband,0.05,beats);       % get the song and bpm

wrap1 = [0.9,0.05,0.05,0.001];     % organ;

sound(Generate_Song2(song,bpm,8000,'sin','C',wrap1),8000);
    
    
    
    
    
    
    