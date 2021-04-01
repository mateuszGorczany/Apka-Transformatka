function cords = LadowanieSpiralne(nazwa_zdjecia,path)
%% Created by Mateusz Górczany & Karol Szeliga

obraz_kolor = imread(fullfile(path,nazwa_zdjecia));
obraz_bw = rgb2gray(obraz_kolor);


obraz_edge = edge(obraz_bw, 'Sobel');
siz = size(obraz_edge);
sze = siz(1,1);
wys = siz(1,2);

if sze <= wys
    mniej = sze;
else
    mniej = wys;
end

if mod(mniej,2) == 0
    srodek = mniej/2;
else
    srodek = (mniej+1)/2 ;
end

ile_pikseli = 0;
    for i = 1:sze
        for k = 1:wys
            if obraz_edge(i ,k ) == 1
                ile_pikseli = ile_pikseli+1;
            end
        end
    end
    
cords = [0,0];    
if ile_pikseli > 6000
    return
end


x =NaN(1,ile_pikseli);
y =NaN(1,ile_pikseli); 
ix = 0;
iy = 0;
h = 1;
iter = 1;
koniec = 0;

while koniec == 0
    for k = 1:h
        if (srodek + abs(ix) > mniej) || (srodek + abs(ix) < 1)
            koniec = 1;
        else
            if obraz_edge(srodek + ix , srodek + iy) == 1
                x(iter) = srodek + ix;
                y(iter) = srodek + iy;
                iter= iter + 1;
            end
            ix= ix+1;
        end
    end
    
    for k = 1:h
        if (srodek + abs(ix) > mniej) || (srodek + abs(ix) < 1)
            koniec = 1;
        else
            if obraz_edge(srodek + ix , srodek + iy) == 1
                x(iter) = srodek + ix;
                y(iter) = srodek + iy;
                iter= iter + 1;
            end
            iy= iy+1;
        end
    end
    
    h = h+1;
    
    for k = 1:h
        if (srodek + abs(ix) > mniej) || (srodek + abs(ix) < 1)
            koniec = 1;
        else
            if obraz_edge(srodek + ix , srodek + iy) == 1
                x(iter) = srodek + ix;
                y(iter) = srodek + iy;
                iter= iter + 1;
            end
            ix= ix-1;
        end
    end
    
    for k = 1:h
        if (srodek + abs(ix) > mniej) || (srodek + abs(ix) < 1)
            koniec = 1;
        else
            if obraz_edge(srodek + ix , srodek + iy) == 1
                x(iter) = srodek + ix;
                y(iter) = srodek + iy;
                iter= iter + 1;
            end
            iy= iy-1;
        end
    end
       
    h = h+1;
%     plot(app.UIAxes,y,-x,'.');
%     xlim(app.UIAxes,[0 wys]);
%     ylim(app.UIAxes,[-sze 0]);
%     pause(0.0000001);
end
    
for i = mniej:wys
    for k = 1:sze
      if obraz_edge(k,i) == 1
          x(iter) = k;
          y(iter) = i;
          iter= iter + 1;
      end
    end
%     plot(app.UIAxes,y,-x,'.');
%     xlim(app.UIAxes,[0 wys]);
%     ylim(app.UIAxes,[-sze 0]);
%     pause(0.0000001);
end

cords = [y',-x'];
cords = reshape(cords(~isnan(cords)),[],size(cords,2));

        end