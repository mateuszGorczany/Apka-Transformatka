function [drawing, radii, limSetup] = CalculationsFourier(toAnimate)
%% Created by Mateusz Górczany & Karol Szeliga


limSetup.MaX = max(toAnimate(:,1));
limSetup.MaY = max(toAnimate(:,2));
limSetup.MinY = min(toAnimate(:,2));
limSetup.MinX = min(toAnimate(:,1));
diffX = abs(limSetup.MinX - limSetup.MaX);
diffY = abs(limSetup.MinY - limSetup.MaY);
limSetup.WidestAxe =  max(diffX, diffY);

%%

fourier = DiscreteFourierT(toAnimate);


drawing = NaN(fourier.length,2,fourier.length);
periods = 0;
time = 0;

i=0;
while periods < 2
    i = i+1;
    drawing(:,:,i) = DrawCircles(fourier,time);
    
    if i > fourier.length
        periods = periods + 1;
    end
    time = time+fourier.dt;
end

radii = fourier.R;
limSetup.index = i;
limSetup.size = fourier.length;

end

