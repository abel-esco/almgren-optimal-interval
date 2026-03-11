% demo_find_zeros.m
% just testing my find_zeros function with a few different functions

clc; clear; close all;

% --- test 1: cosine function ---
disp('Testing g(x) = cos(x)');
find_zeros('cos(x)');
pause;  % wait so I can see the plot before moving on

% --- test 2: a simple polynomial ---
disp('Testing g(x) = x.^3 - 4*x');
find_zeros('x.^3 - 4*x');
pause;

% --- test 3: exponential times sine ---
disp('Testing g(x) = exp(-x).*sin(5*x)');
find_zeros('exp(-x).*sin(5*x)');
pause;

% --- test 4: parabola (double root example) ---
disp('Testing g(x) = x.^2');
find_zeros('x.^2');
pause;

% --- test 5: something a bit random ---
disp('Testing g(x) = sin(x) + 0.5*x');
find_zeros('sin(x) + 0.5*x');

disp('All tests done!');