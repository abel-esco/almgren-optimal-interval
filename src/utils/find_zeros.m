function zeros_found = find_zeros(g_input)
% find_zeros.m
% This program finds all zeros of a function g(x) in a big interval.
% I made it so you only have to enter the function, and it searches automatically.

clc;

% --- define the function (user can enter a string or function handle)
if isa(g_input, 'char') || isa(g_input, 'string')
    g = str2func(['@(x)', char(g_input)]);
elseif isa(g_input, 'function_handle')
    g = g_input;
else
    error('Please enter either a string like "cos(x)" or a function handle like @(x)cos(x)');
end

% --- setup the search range and number of points ---
a = -100;  % start of search
b = 100;   % end of search
N = 20000; % number of sample points
x = linspace(a, b, N);
zeros_found = [];

% --- go through the points and look for sign changes ---
for i = 1:N-1
    y1 = g(x(i));
    y2 = g(x(i+1));

    % check if values are valid and sign changes
    if isfinite(y1) && isfinite(y2) && y1 * y2 < 0
        try
            % use fzero to find the exact zero between those two points
            z = fzero(g, [x(i), x(i+1)]);
            zeros_found(end+1) = z;
        catch
            % skip if fzero has an issue
        end
    end
end

% --- remove duplicates and sort the results ---
if ~isempty(zeros_found)
    zeros_found = unique(round(zeros_found, 6));
    zeros_found = sort(zeros_found);
end

% --- show the results ---
if isempty(zeros_found)
    disp('No zeros found in the range [-100, 100].');
else
    disp('Zeros of g(x) found in [-100, 100]:');
    disp(zeros_found');
end

% --- plot the function and mark zeros (optional but helpful) ---
xp = linspace(a, b, 2000);
yp = arrayfun(g, xp);
figure;
plot(xp, yp, 'b'); hold on;
plot(zeros_found, zeros_found*0, 'ro', 'MarkerFaceColor', 'r');
yline(0, '--k');
xlabel('x'); ylabel('g(x)');
title('Function and its zeros');
grid on;
end