wrap1 = [0.9,0.05,0.05,0.001];     % organ;
wrap2 = [0.05,0.9,0.05,0.001];     % piano
wrap3 = [0.05,0.4,0.5,0.8];        % guitar
wrap4 = [0.25,0.25,0.25,0.5];      % all middle

dong_fang_hong = [struct('note',5,'beats',1),
    struct('note',5,'beats',0.5),
    struct('note',6,'beats',0.5),
    struct('note',2,'beats',2),
    struct('note',1,'beats',1),
    struct('note',1,'beats',0.5),
    struct('note',-1,'beats',0.5),
    struct('note',2,'beats',2)];

harmonic = [1,0.2,0.3];
% add harmonics, simulate guitar
for i = 1 : length(dong_fang_hong)
    if dong_fang_hong(i).note == -1
        dong_fang_hong(i).amp = [1,0.9,0.25,0,0,0.2];
    elseif dong_fang_hong(i).note == 1
    	dong_fang_hong(i).amp = [1,0.2,0.1,0.1];
   	elseif dong_fang_hong(i).note == 2
   		dong_fang_hong(i).amp = [1,0.1];
   	else
   		dong_fang_hong(i).amp = [1];
   	end
end

% sound(Generate_Song2(dong_fang_hong,140,8000,'sin','F',wrap1,harmonic),8000);        % add harmonics

% sound(Generate_Song2(dong_fang_hong,140,8000,'sin','F',wrap1,1,harmonic),8000);		% raise half

% harmonic = [6.6168,9.6937,6.3889,7.3860];
% harmonic = harmonic / harmonic(1);
% sound(Generate_Song2(dong_fang_hong,140,8000,'sin','F',wrap3,harmonic),8000);       % high10

sound(Generate_Song2(dong_fang_hong,140,8000,'sin','F',wrap3),8000);




