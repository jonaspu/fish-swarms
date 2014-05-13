x = linspace(0.8, 5, 1000);

hold on
cc = hsv(7);

plot(x, 1./x.^7 - 1./x.^(8),'color', cc(7,:), 'LineWidth', 2);
plot(x, 1./x.^3 - 1./x.^(4),'color', cc(5,:), 'LineWidth', 2);
plot(x, 1./x.^2 - 1./x.^3, 'color', cc(3, :), 'LineWidth', 2);
plot(x, 0, 'color', 'black', 'LineWidth', 1);
box on;
xlim([0.7, 5]);
ylim([-0.7, 0.7]);
set(gca, 'FontSize', 18); 
ylabel('total force');
xlabel('agent distance');
legend('gamma = -6, alpha = -7','gamma = -2, alpha = -3','gamma = -1, alpha = -2', 'Location', 'SouthEast');

