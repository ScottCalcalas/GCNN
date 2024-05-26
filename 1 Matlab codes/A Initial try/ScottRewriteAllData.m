clc
clear
%%
[h2401,d2401] = edfread('103.edf');

d000=d2401(1:8,:);


save f103.txt d000 -ascii

fprintf("done\n")