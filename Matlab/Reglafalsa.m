% Function to be evaluated
f = @(x) x^3 - 2*x - 5;

% Interval of interest
a = 2;
b = 3;

% Verify that the function has opposite signs at the ends of the interval
if f(a)*f(b) > 0
    error('La función no cambia de signo en el intervalo dado / The function does not change sign in the given interval');
end

% Stop criteria
tol = 1e-6; % Tolerance
maxiter = 100; % Maximum number of iterations

% Variable initialization
iter = 0;
x = a;
fa = f(a);
fb = f(b);

% Table of results
fprintf('iter \t a \t\t b \t\t x \t\t f(a) \t\t f(b) \t\t f(x) \n');

% Implementation of the false rule method
while abs(f(x)) > tol && iter < maxiter
    iter = iter + 1;
    x = (a*fb - b*fa)/(fb - fa);
    fx = f(x);
    
    % Show results at each iteration
    fprintf('%d \t %f \t %f \t %f \t %f \t %f \t %f \n', iter, a, b, x, fa, fb, fx);
    
    % Updating of values
    if fx*fa < 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
end

% Final result
if abs(f(x)) <= tol
    fprintf('\nLa raíz aproximada es / The approximate root is x = %f con un error de %f\n', x, abs(f(x)));
else
    fprintf('\nNo se encontró una raíz en %d iteraciones\n', maxiter);
end
