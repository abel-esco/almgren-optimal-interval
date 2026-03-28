% Define the piecewise potential energy function
g = @(x) (x >= 0).*(10.*x.^2) + (x < 0).*(x.^6);
m = 1; % Interval length

% Define the area functional
areaFun = @(a) integral(g, a, a + m);

% Find the minimizer bounded between -1 and 0
[aMin, areaMin] = fminbnd(areaFun, -1, 0);

% Prepare data for plotting
a_vals = linspace(-1, 0, 100);
A_vals = zeros(size(a_vals));
for i = 1:length(a_vals)
    A_vals(i) = areaFun(a_vals(i));
end

% Create the plot
figure;
plot(a_vals, A_vals, 'b-', 'LineWidth', 1.5);
hold on;
plot(aMin, areaMin, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Mark the minimum

% Add labels and text as requested by Indrei
xlabel('a', 'FontSize', 12, 'FontWeight', 'bold'); % Changed from G Value
ylabel('Area Functional A(a)', 'FontSize', 12);
title('Numerical Evaluation of the Area Functional A(a)');

% Add text specifying the exact c value
text(aMin, areaMin + 0.05, sprintf('Global Min: c \\approx %.3f', aMin), ...
    'HorizontalAlignment', 'center', 'FontSize', 11, 'Color', 'red');
grid on;
hold off;
