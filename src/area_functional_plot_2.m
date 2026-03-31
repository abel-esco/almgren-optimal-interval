% Define the piecewise potential energy function (Example 2)
g = @(x) (x >= 0).*(2.*x.^2) + (x < 0).*(x.^4);

% Define the mass/length of the interval
m = 1;

% Define the area functional over an interval of length m
areaFun = @(a) integral(@(x) g(x), a, a + m);

% Find the minimizer bounded between -m and 0
[aMin, areaMin] = fminbnd(areaFun, -m, 0);

% Display the results
fprintf('The optimal interval is [%f, %f]\n', aMin, aMin + m);
fprintf('The minimum area is %f\n', areaMin);

% Plotting the Area Functional
a_vals = linspace(-1, 0, 100);
A_vals = arrayfun(areaFun, a_vals);

figure;
plot(a_vals, A_vals, 'b-', 'LineWidth', 2);
hold on;
plot(aMin, areaMin, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
grid on;
xlabel('Starting position of interval a');
ylabel('Area Functional A(a)');
title('Numerical Evaluation of A(a) - Example 2');
text(aMin, areaMin + 0.05, sprintf('  Global Min: c \\approx %.3f', aMin), 'Color', 'red');