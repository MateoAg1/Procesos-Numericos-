% Function: f(x)
% Interval: [a,b] 
% Tolerance: tol
% Maximum number of iterations: maxiter

% Verify if the function is suitable for the bisection method
if f(a)*f(b) >= 0
    error('La función no cambia de signo en el intervalo dado. El método de la bisección no es adecuado. / The function does not change sign in the given interval. The bisection method is not suitable.')
end

% Initialize variables
iter = 0;
fa = f(a);
fb = f(b);

% Print table header
fprintf('Iteration \t a \t\t b \t\t c \t\t f(c)\n')

% Main loop
while (b-a)/2 > tol && iter < maxiter
    % Calculate midpoint
    c = (a+b)/2;
    fc = f(c);
    
    % Print values of the current iteration
    fprintf('%d \t\t %.4f \t %.4f \t %.4f \t %.4f\n', iter, a, b, c, fc)
    
    % Check if c is the exact root
    if fc == 0
        break
    end
    
    % Update interval
    if fa*fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
    
    % Increment iteration counter
    iter = iter + 1;
end

% Print final result
fprintf('Raíz aproximada / Approximate root: %.4f\n', c)
