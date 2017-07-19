function [f,bpm] = Frequency2Note(baseband,ratio,beats)
% input:
% baseband: type: struct;
% ratio: type: double;
% beats: type: 1*n matrix.
% 
% output:
% f: type: struct, song;
% bpm: type: numerical

freq = [];
for i = -7 : 12
    freq = [freq,Note2Frequency('C',i)];
end
map = containers.Map(freq,-7:12);

min_beats = min(beats);
bpm = 60/min_beats;
for i = 1 : length(baseband)
    baseband(i).beats = beats(i)/min_beats;
    j = 1;
    while j <= length(baseband(i).note)
        success = 0;
        flag = 1;
        while flag <= length(freq) 
            if baseband(i).note(j)>=freq(flag)*(1-ratio) & ...
                    baseband(i).note(j)<=freq(flag)*(1+ratio)
                baseband(i).note(j) = map(freq(flag));
                if j==1 || (j~=1 & baseband(i).note(j)~=baseband(i).note(j-1))
                    j = j + 1;
                    success = 1;
                    break;
                end
            else
                flag = flag + 1;
            end
        end
        if success == 0
            baseband(i).note(j) = [];
            baseband(i).amp(j) = [];
        end
    end
end
f = baseband;

end
