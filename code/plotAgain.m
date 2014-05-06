l = size(preyPlot, 1);
l = l/2;
for i=1:l
    
    plot(preyPlot(i*2-1, :), preyPlot(i*2, :), 'b*', predPlot(i*2-1, :), predPlot(i*2, :), 'r*')
    xlim([-20, 20])
    ylim([-20, 20])
    pause(0.001)
    
end