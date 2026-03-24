% Define the piecewise potential energy function
q = @(x) (x >= 0).*(10.*x.^2) + (x < 0).*(x.^6);

% Define the area functional over an interval of length 1
areaFun = @(a) integral(@(x) q(x), a, a + 1);

% Find the minimizer bounded between -1 and 0 (verifying the analytical proof)
[aMin, areaMin] = fminbnd(areaFun, -1, 0);

% Display the results
fprintf('Best interval is approximately [%f, %f]\n', aMin, aMin + 1);
fprintf('Minimum area is approximately %f\n', areaMin);
