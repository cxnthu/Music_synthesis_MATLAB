function f = Generate_Song2(song,bpm,SampleFrequency,wave,key,wrap,adjust,harmonic)
% input:
% song: type: struct, the first colume represents the note('rest' means
% rest in music), while the second colume represents the duration of time;
% bpm: type: int, beats per minute;
% SampleFrequency: type: int, the frequency of sampling signal;
% wave: type: string, different sampling wave, e.g. 'sin','square'...;
% key: type: char, i.e. 'A','B'...;
% wrap: type: 1*4 char matrix; represents p_impulse, p_decline, p_disappear,
% amp_keep;
% adjust: type: int, default:0, 1 means '#', -1 means 'b';
% harmonic: type: 1*4 matrix, represents harmony.
% 
% output:
% f: type: 1*n double matric. 

% parameter checkout
validateattributes(bpm,{'numeric'},{'nonempty'});
validateattributes(SampleFrequency,{'numeric'},{'nonempty'});
validateattributes(wave,{'char'},{'nonempty'});
validateattributes(key,{'char'},{'nonempty'});
if nargin == 6
	adjust = 0;
    harmonic = [];
elseif nargin == 7
    if length(adjust) ~= 1
        harmonic = adjust;
        adjust = 0;
    else
        harmonic = [];
    end
end

% get wave
f = [];
if wave == 'sin'
    op = @sin;
elseif wave == 'square'
    op = @square;
else
    op = @sawtooth;
end

for i = 1 : length(song)
    t = 0 : 1/SampleFrequency : (60/bpm)*song(i).beats;
    tem = zeros(size(t));
    if song(i).note ~= -inf
        if length(harmonic) == 0
            if length(song(i).note) == length(song(i).amp)
                for k = 1 : length(song(i).note)
                    tem = tem + song(i).amp(k) * ...
                        op(2*pi*t*Note2Frequency(key,song(i).note(k),adjust));
                end
            else
                base = Note2Frequency(key,song(i).note,adjust);
                for k = 1 : length(song(i).amp)
                    tem = tem + song(i).amp(k) * op(k*2*pi*t*base);
                end
            end
        else
            for k = 1 : length(harmonic)
                tem = tem + harmonic(k) * op(k*...
                    2*pi*t*Note2Frequency(key,song(i).note,adjust));
            end
        end
        tem = Generate_Wrap(wrap(1),wrap(2),wrap(3),wrap(4),tem,t);
    end
    f = [f,tem];
end

f = f/max(f);       %normalization
end
    
 
    