function MakeGif(drawing,radii,limSetup, offset, pauseVal)
%% Created by Mateusz Górczany & Karol Szeliga

h = figure;
axis tight manual 
filename = 'Animacja.gif';
frame=getframe(gca);
im=frame2im(frame); 
[imind,cm] = rgb2ind(im,256); 
imwrite(imind,cm,filename,'gif','DelayTime',0, 'Loopcount',inf);

pauseVal = pauseVal/1000;

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

pl2 = plot(aone,d(1,1), d(1,2),'k.');
if limSetup.size < 1500
    circ = viscircles(aone, drawing(2:end,:,1),radii(2:end,:),'Color','r' ,'LineWidth',0.1);
    l = plot(aone,drawing(2:end,1,1),drawing(2:end,2,1), 'LineWidth', 1, 'Color', 'k');
    set(pl2, 'Color','#0072BD');
    set(pl2, 'Marker', '.');
else
    l = plot(aone,drawing(2:end,1,1),drawing(2:end,2,1), 'LineWidth', 2, 'Color', '#A2142F');
end
i = 0;
if limSetup.size < 1500 
    while i < size(drawing,3)
        i = i+1;   
        
        delete(circ);	

        circ = viscircles(aone, drawing(2:end,:,i),radii(2:end,:),'Color', 'r','LineWidth',0.1);
        set(l, 'XData', drawing(1:end,1,i), 'YData', drawing(1:end,2,i));
        set(pl2,'XData', d(1:i,1),'YData', d(1:i,2));
        drawnow;
        pause(pauseVal)
        
        frame(i) = getframe(aone);
   
    end
    delete(circ);
    delete(l);
else
    while i < size(drawing,3)
    i = i+1;
    set(l, 'XData', drawing(1:end,1,i), 'YData', drawing(1:end,2,i));
    set(pl2,'XData', d(1:i,1),'YData', d(1:i,2));
    
    pause(pauseVal);
    
    frame(i) = getframe(aone);
   
       
    end
    delete(l);
end
hold off;

for index=1:i
        im=frame2im(frame(index)); 
        [imind,cm] = rgb2ind(im,256);
        imwrite(imind,cm,filename, 'gif','DelayTime',0,'WriteMode','append');
end

end


