%% Created by Mateusz Górczany & Karol Szeliga

%% ŁADOWANE SPIRALNE %%
clear;clc;
offset = 10; % jak daleko od krawędzi ramki będzie obrazek
pauseVal = 1; % pauza na klatce w ms

[nazwa_zdjecia, path] = uigetfile('*');
"Liczę"
[x, y, z] = CalculationsFourier(LadowanieSpiralne(nazwa_zdjecia,path));
"Policzylem"
Animate(x,y,z,offset, pauseVal);
%MakeGif(x,y,z,offset, pauseVal);

%% ŁADOWANE PROSTE %%
clear;clc;
offset = 10; % jak daleko od krawędzi ramki będzie obrazek
pauseVal = 10; % pauza na klatce w ms

[nazwa_zdjecia, path] = uigetfile('*');
"Liczę"
[x, y, z ] = CalculationsFourier(LadowanieProste(nazwa_zdjecia,path));
"Policzylem"
Animate(x,y,z,offset, pauseVal);
%MakeGif(x,y,z,offset, pauseVal);

%% ŁADOWANE PO LINII %%
clear;clc;
offset = 10; % jak daleko od krawędzi ramki będzie obrazek
pauseVal = 1; % pauza na klatce w ms

[nazwa_zdjecia, path] = uigetfile('*');
"Liczę"
[x, y, z ] = CalculationsFourier(LadowaniePoLinii(nazwa_zdjecia,path));
"Policzylem"
Animate(x,y,z,offset, pauseVal);
%MakeGif(x,y,z,offset, pauseVal);

%% ŁADOWANIE SUROWYCH DANYCH (rozsz. txt)%%
clear;clc;
[nazwa_zdjecia, path] = uigetfile('*');
s = importdata(fullfile(path,nazwa_zdjecia)); % load data
cords = [s(:,1),s(:,2)];
offset = 10;
pauseVal = 10;

[drawing,radii, setup] = CalculationsFourier(cords);
Animate(drawing,radii,setup,offset, pauseVal);