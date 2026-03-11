function [root1, root2] = quadratic_solver(a, b, c)
% QUADRATIC_SOLVER Solves any quadratic equation: ax^2 + bx + c = 0
% Usage:
%   [r1, r2] = quadratic_solver(a, b, c)
%
% Example:
%   [r1, r2] = quadratic_solver(1, -3, 2)

    % Check if 'a' is zero
    if a == 0
        error('Coefficient "a" cannot be zero for a quadratic equation.');
    end

    % Calculate the discriminant
    D = b^2 - 4*a*c;

    % Solve based on discriminant
    if D > 0
        root1 = (-b + sqrt(D)) / (2*a);
        root2 = (-b - sqrt(D)) / (2*a);
        fprintf('Two real roots: x1 = %.4f, x2 = %.4f\n', root1, root2);
    elseif D == 0
        root1 = -b / (2*a);
        root2 = root1;
        fprintf('One real root: x = %.4f\n', root1);
    else
        realPart = -b / (2*a);
        imagPart = sqrt(-D) / (2*a);
        root1 = complex(realPart, imagPart);
        root2 = complex(realPart, -imagPart);
        fprintf('Complex roots: x1 = %.4f + %.4fi, x2 = %.4f - %.4fi\n', ...
                realPart, imagPart, realPart, imagPart);
    end
end