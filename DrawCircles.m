function [X,rad] = DrawCircles(fourier,time)
%% Created by Mateusz Górczany & Karol Szeliga

X = zeros(fourier.length, 2);

X(1,1) = fourier.R(1)*cos(fourier.freq(1)*time+fourier.phase(1)); % zrób tablice xsow
X(1,2) = fourier.R(1)*sin(fourier.freq(1)*time+fourier.phase(1));

rad = NaN(fourier.length, 2);

rad(1,:) = [0, 0];

for i = 2:fourier.length   
   X(i,1) = X(i-1,1) + fourier.R(i)*cos(fourier.freq(i)*time+fourier.phase(i)); % zrób tablice xsow
   X(i,2) = X(i-1,2) + fourier.R(i)*sin(fourier.freq(i)*time+fourier.phase(i)); % zrob talibce ykow
   
end

end


