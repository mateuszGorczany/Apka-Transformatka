function F_or_T = czy_nie_jest_zapisany(dlu,x,y, x1, y1)
%% Created by Mateusz Górczany & Karol Szeliga

F_or_T = 1;
for i = 1 : dlu-1
    %if ((x(i) <= x1+3) & (x(i) >= x1-3)) & ((y(i) <= y1+3) & (y(i) >= y1-3))
    if  (x(i) == x1) & (y(i) == y1)
        F_or_T = 0;
    end
end
