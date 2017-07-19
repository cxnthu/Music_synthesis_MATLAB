wrap2 = [0.05,0.9,0.05,0.001];     % piano

harmonic = [1,0.2,0.3];

summer = [-Inf    0.5000;
    6.0000    0.5000;
   10.0000    0.5000;
    9.0000    0.5000;
   13.0000    1.0000;
      -Inf    1.0000;
      -Inf    0.5000;
    6.0000    0.5000;
   10.0000    0.5000;
    9.0000    0.5000;
   13.0000    1.0000;
      -Inf    1.0000;
      -Inf    0.5000;
    6.0000    0.5000;
   10.0000    0.5000;
    9.0000    0.5000;
   13.0000    1.0000;
      -Inf    1.0000;
      -Inf    0.5000;
    6.0000    0.5000;
   10.0000    0.5000;
    9.0000    0.5000;
   13.0000    1.0000;
      -Inf    1.0000;
    3.0000    2.0000;
    3.0000    0.5000;
    3.0000    0.5000;
    4.0000    0.5000;
    5.0000    0.5000;
    2.0000    2.0000;
    2.0000    0.5000;
    2.0000    0.5000;
    5.0000    0.5000;
         0    0.5000;
    1.0000    2.0000;
    1.0000    0.5000;
    1.0000    0.5000;
    2.0000    0.5000;
    2.0000    0.5000;
    3.0000    2.0000;
    2.0000    1.5000;
   -2.0000    0.5000;
    3.0000    2.0000;
    3.0000    0.5000;
    3.0000    0.5000;
    4.0000    0.5000;
    5.0000    0.5000;
    5.0000    1.0000;
    2.0000    1.0000;
    2.0000    0.5000;
    2.0000    0.5000;
    5.0000    0.5000;
         0    0.5000;
    1.0000    2.0000;
    1.0000    0.5000;
    1.0000    0.5000;
    2.0000    0.5000;
    3.0000    0.5000;
    5.0000    2.0000;
    5.0000    1.0000;
      -Inf    0.5000;
    5.0000    0.5000;
    6.0000    1.5000;
    6.0000    0.5000;
    6.0000    0.5000;
    7.0000    0.5000;
    5.0000    0.5000;
    4.0000    0.5000;
    5.0000    2.0000;
    1.0000    1.0000;
    2.0000    0.5000;
    3.0000    0.5000;
    3.0000    2.0000;
    2.0000    1.5000;
   -1.0000    0.5000;
    3.0000    1.5000;
    4.0000    0.2500;
    3.0000    0.2500;
    2.0000    1.0000;
    8.0000    0.5000;
    7.0000    0.5000;
    8.0000    2.0000;
    8.0000    0.5000;
    5.0000    0.5000;
    8.0000    0.5000;
    9.0000    0.5000;
    8.0000    2.0000;
    8.0000    0.5000;
    5.0000    0.5000;
    8.0000    0.5000;
    9.0000    0.5000;
    8.0000    2.0000;
    6.0000    1.0000;
    8.0000    1.0000;
   10.0000    1.5000;
   11.0000    0.5000;
    9.0000    1.0000;
    8.0000    0.5000;
    7.0000    0.5000;
    8.0000    2.0000;
      -Inf    0.5000;
    5.0000    0.5000;
    8.0000    0.5000;
    9.0000    0.5000;
    8.0000    2.0000;
      -Inf    0.5000;
    5.0000    0.5000;
    8.0000    0.5000;
    9.0000    0.5000;
    8.0000    2.0000;
    8.0000    1.0000;
    6.0000    0.5000;
    8.0000    0.5000;
   10.0000    2.0000;
    9.0000    1.5000;
   10.0000    0.5000;
   11.0000    2.0000;
      -Inf    0.5000;
   10.0000    0.5000;
   11.0000    0.5000;
   12.0000    0.5000;
    9.0000    2.0000;
    9.0000    1.5000;
    9.0000    0.5000;
   10.0000    2.0000;
   10.0000    0.5000;
   11.0000    0.5000;
   10.0000    0.5000;
    7.0000    0.5000;
    9.0000    1.0000;
    8.0000    1.0000;
    8.0000    1.0000;
    6.0000    0.5000;
    7.0000    0.5000;
    8.0000    0.5000;
    7.0000    0.5000;
    6.0000    1.0000;
    6.0000    1.0000;
    5.0000    0.5000;
    6.0000    0.5000;
    7.0000    2.0000;
    7.0000    1.0000;
    5.0000    1.0000;
    3.0000    2.0000;
    3.0000    2.0000;
    3.0000    2.0000;
    3.0000    2.0000];

Summer = [];
for i = 1 : size(summer,1)
    Summer = [Summer,struct('note',summer(i,1),'beats',summer(i,2))];
end
% use piano
sound(Generate_Song2(Summer,140,8000,'sin','E',wrap2,-1,harmonic),8000);    



