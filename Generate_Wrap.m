function f = Generate_Wrap(p_impulse,p_decline,p_disappear,amp_keep,list,t)
% input:
% p_impulse: type: double, percentage of impulse;
% p_decline: type: double, percentage of decline;
% p_disappear: type: double, percentage of disappaer;
% amp_keep: type: double, amplitude relatively;
% list: type: 1*n matrix, the original note;
% t: type: 1*n matrix, the corresponding time.
% 
% output:
% f: type: 1*n matrix.

% parameter checkout
validateattributes(p_impulse,{'numeric'},{'>',0,'<',1});
validateattributes(p_decline,{'numeric'},{'>',0,'<',1});
validateattributes(p_disappear,{'numeric'},{'>',0,'<',1});
validateattributes(amp_keep,{'numeric'},{'>',0,'<',1});

p_keep = 1 - p_impulse - p_decline - p_disappear;
L = length(list);
L_impulse = floor(L*p_impulse);
L_decline = floor(L*(p_impulse+p_decline));
L_keep = floor(L*(p_impulse+p_decline+p_keep));
ta = t(1:L_impulse);
td = t(L_impulse+1:L_decline);
tr = t(L_keep+1:end);

% envelope for Attack
ea = (1-exp(-ta))/(1-exp(-ta(end))); 
% envelope for Decay
ed = (1-amp_keep)*(exp(-(td-td(end)))-1)/(exp(-(td(1)-td(end)))-1)+amp_keep;
% envelope for Release
er = amp_keep*(exp(amp_keep-(tr-tr(1))/(tr(end)-tr(1))*amp_keep)-1)/...
    (exp(amp_keep)-1);    

wave_impulse = list(1:L_impulse) .* ea;
wave_decline = list(L_impulse+1:L_decline) .* ed;
wave_keep = list(L_decline+1:L_keep) .* amp_keep;			
wave_disappear = list(L_keep+1:end) .* er;

f = [wave_impulse,wave_decline,wave_keep,wave_disappear];

end
