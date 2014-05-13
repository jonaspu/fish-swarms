box on;
set(gca, 'FontSize', 18); 
ylabel('y Position');
xlabel('x Position');
plot(positionPrey(1, :), positionPrey(2, :), 'b*', positionPred(1,:), positionPred(2,:), 'r*', 'LineWidth', 3)
xlim([-3, 3])
ylim([-3, 3])