function f = Note2Frequency(key,note,adjust)
% input:
% key: type: char, i.e. 'A','B'...;
% note: type: int;
% adjust: type: int, default:0, 1 means '#', -1 means 'b'.
% 
% output;
% f: type: double, frequency of matched Note.

% parameter checkout 
validateattributes(key,{'char'},{'nonempty'});
validateattributes(note,{'numeric'},{'nonempty'});
if nargin == 2
    adjust = 0;
end

if note < 1 || note > 7         %deal with low and high pitched
    f = 2^floor((note-1)/7) * Note2Frequency(key,mod(note - 1,7) + 1,adjust);
    return
end

list = 2.^((0:11)/12)*220;		%generate A,bB,B,C,bD,D,bE,E,F,bG,G,bA
match = containers.Map({'A','B','C','D','E','F','G'},{1,3,4,6,8,9,11});
Do_Frequency = list(match(key) + adjust); 

if note <= 3					% Do Re Mi
    f = Do_Frequency * 2^(2 * (note - 1) / 12);
else                			% Fa So La Si
    f = Do_Frequency * 2^((2 * (note - 1) - 1) / 12);
end
end



