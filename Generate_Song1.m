function f = Generate_Song1(song,bpm,SampleFrequency,wave,key,adjust)
% input:
% song: type: n*2 matrix, the first colume represents the note('rest' means
% rest in music, while the second colume represents the duration of time;
% bpm: type: int, beats per minute;
% SampleFrequency: type: int, the frequency of sampling signal;
% wave: type: string, different sampling wave, e.g. 'sin','square'...;
% key: type: char, i.e. 'A','B'...;
% adjust: type: int, default:0, 1 means '#', -1 means 'b'.
% 
% output:
% f: type: 1*n double matric. 

% parameter checkout
validateattributes(bpm,{'numeric'},{'nonempty'});
validateattributes(SampleFrequency,{'numeric'},{'nonempty'});
validateattributes(wave,{'char'},{'nonempty'});
validateattributes(key,{'char'},{'nonempty'});
if nargin == 5
	adjust = 0;
end

f = [];
if wave == 'sin'
    op = @sin;
elseif wave == 'square'
    op = @square;
else
    op = @sawtooth;
end
for i = 1:size(song,1)
    t = 0 : 1/SampleFrequency : (60/bpm)*song(i,2);
	if song(i,1) == -inf
		f = [f,zeros(size(t))];
	else
		f = [f,op(2*pi*t*Note2Frequency(key,song(i,1),adjust))];
    end
end

f = f/max(f);		%normalization
end