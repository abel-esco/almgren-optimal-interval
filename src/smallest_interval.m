f = @(x) (x >= 0).*x.^1.5 + (x < 0).*0.01.*x.^10;

areaFun = @(a) integral(@(x) f(x), a, a + 1);

[aMin, areaMin] = fminbnd(areaFun, -10, 10);

fprintf('Best interval is approximately [%f, %f]\n', aMin, aMin + 1);
fprintf('Minimum area is approximately %f\n', areaMin);