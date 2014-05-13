l = size(preyPlot, 1);
l = l/2;
% for i=1:l
%     
%     plot(preyPlot(i*2-1, :), preyPlot(i*2, :), 'b*', predPlot(i*2-1, :), predPlot(i*2, :), 'r*')
%     xlim([-20, 20])
%     ylim([-20, 20])
%     pause(0.001)
%     
% end
box on;
set(gca, 'FontSize', 18);


hold on;
preyX = preyPlot(1, :); preyY = preyPlot(2, :);
for j=2:size(preyPlot, 1)/2 preyX = [preyX; preyPlot(j*2-1, :)];
    preyY = [preyY; preyPlot(j*2, :)];
end
predX = predPlot(j*2-1, :);
predY = predPlot(j*2, :);
for j = 2:size(predPlot, 1)/2 predX = [predX; predPlot(j*2-1, :)];
    predY = [predY; predPlot(j*2, :)];
end
hold on;
for i = 1:size(preyX, 2) plot(preyX(size(preyX,1)/2:size(preyX,1), i), preyY(size(preyX,1)/2:size(preyX,1), i), '-');
end
for i = 1:size(predX, 2) plot(predX(size(predX,1)/2:size(predX,1), i), predY(size(predX,1)/2:size(predX,1), i), 'r-');
end