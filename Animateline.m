function Animateline(drawing,radii,limSetup, offset, pauseVal)
%%% Created by Mateusz Górczany & Karol Szeliga

pauseVal = pauseVal/1000;

figure(1);
cla;
aone = gca;
hold on;
%set(aone, 'visible', 'off');
set(aone, 'xtick', []);
set(aone, 'ytick', []);

set(aone, 'XLim', [-offset+limSetup.MinX, offset + limSetup.MaX]);
set(aone, 'YLim', [-offset+limSetup.MinY, offset + limSetup.MaY]);

d = NaN(size(drawing,3),1);

d = squeeze(drawing(end,:,:));
d = d';


curve2 = animatedline(aone, 'Color', 'k','LineWidth',2);
if limSetup.size < 1500
    circ = viscircles(aone, drawing(2:end,:,1),radii(2:end,:),'Color','r' ,'LineWidth',0.1);
    l = plot(aone,drawing(1:end,1,1),drawing(1:end,2,1), 'LineWidth', 1, 'Color', 'k');
    set(curve2, 'Color', '#0072BD');
else
    l = plot(aone,drawing(2:end,1,1),drawing(2:end,2,1), 'LineWidth', 2, 'Color', '#A2142F');
end
i = 0;
if limSetup.size < 1500 
    while i < size(drawing,3)
        i = i+1;    
        delete(circ);

        circ = viscircles(aone, drawing(2:end,:,i),radii(2:end,:),'Color','r' ,'LineWidth',0.1);
        set(l, 'XData', drawing(1:end,1,i), 'YData', drawing(1:end,2,i));
        addpoints(curve2, d(i,1), d(i,2));
        pause(pauseVal);
    end
    delete(circ);
    delete(l);
else
    while i < size(drawing,3)
    i = i+1;

    set(l, 'XData', drawing(1:end,1,i), 'YData', drawing(1:end,2,i));
    addpoints(curve2, d(i,1), d(i,2));

    pause(pauseVal);   
    end
    delete(l);
end
hold off;

end

