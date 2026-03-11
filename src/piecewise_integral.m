% Clear workspace
clear; clc;

% Define symbolic variable
syms x

% Define the two pieces of your function
f_neg = x^6;       % for x < 0
f_pos = 10*x^2;    % for x >= 0

% Precompute the antiderivatives (indefinite integrals)
F_neg = int(f_neg, x);   % = x^7 / 7
F_pos = int(f_pos, x);   % = (10/3)*x^3

% Define constants
a1 = -0.823439119457173;  % lower limit for x^6 piece (before adding G)
b1 = 0;                   % upper limit for x^6 piece
a2 = 0;                   % lower limit for 10x^2 piece
b2 = 0.17656088054;       % upper limit for 10x^2 piece

% Define range of G values
G_values = -0.5:0.00001:0.5;
numG = length(G_values);

% Preallocate results array for speed
results = zeros(numG, 2); % column 1 = G, column 2 = sum of integrals

% Loop through all G values
for i = 1:numG
    G = G_values(i);

    % Compute shifted limits
    lower_neg = a1 + G;
    upper_neg = b1;
    lower_pos = a2;
    upper_pos = b2 + G;

    % Evaluate definite integrals using precomputed antiderivatives
    I1 = double(subs(F_neg, x, upper_neg) - subs(F_neg, x, lower_neg));
    I2 = double(subs(F_pos, x, upper_pos) - subs(F_pos, x, lower_pos));

    % Total integral sum
    total = I1 + I2;

    % Store G and total
    results(i, :) = [G, total];
end

% Convert to table for display
resultsTable = array2table(results, 'VariableNames', {'G_value', 'Integral_Sum'});
disp(resultsTable);

% Plot results
figure;
plot(results(:,1), results(:,2));
xlabel('G Value');
ylabel('Sum of Integrals');
title('Integral Sum vs. G');
grid on;