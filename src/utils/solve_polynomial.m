function r = solve_polynomial(coeffs)
% SOLVE_POLYNOMIAL Find roots of any polynomial given coefficients.
% Works for quadratic, cubic, or any higher degree polynomial.
%
% Example:
%   solve_polynomial([1 -3 2])     % x^2 - 3x + 2
%   solve_polynomial([1 0 0 -1])   % x^3 - 1
%   solve_polynomial([1 0 0 0 0 0 0 -3 0 0 4])   % x^10 - 3x^3 + 4

    if isempty(coeffs) || ~isnumeric(coeffs)
        error('Input must be a numeric vector of coefficients.');
    end

    % Find the roots
    r = roots(coeffs);

    % Keep only real roots
    real_roots = r(imag(r) == 0);

    % Keep only negative roots
    neg_roots = real_roots(real_roots < 0);

    % Display just the negative roots
    disp('Negative real roots are:')
    disp(neg_roots)

    % Display results
    %disp('Roots of the polynomial are:');
    %disp(r);

    % Optional: Plot it
    x = linspace(-10,10,500);
    y = polyval(coeffs, x);
    figure;
    plot(x, y, 'LineWidth', 1.5);
    yline(0, '--');
    grid on;
    title('Polynomial Graph');
    xlabel('x');
    ylabel('f(x)');
end