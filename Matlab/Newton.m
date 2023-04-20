% Define the function and its derivative
f = @(x) x^3 - 2*x - 5;
df = @(x) 3*x^2 - 2;

% Define the starting point and tolerance
x0 = 2;
tol = 1e-6;

% Initialize the iteration counter and error
iter = 0;
err = inf;

% Print the initial table
fprintf('Iter\t x\t\t f(x)\t\t err\n');
fprintf('%d\t %f\t %e\t %e\n', iter, x0, f(x0), err);

% Iterate until error is less than tolerance
while err > tol
    % We calculate the following approximation
    x = x0 - f(x0) / df(x0);
    
    % We calculate the relative error
    err = abs((x - x0) / x);
    
    % We update the starting point
    x0 = x;
    
    % Increment the iteration counter
    iter = iter + 1;
    
    % We print the table
    fprintf('%d\t %f\t %e\t %e\n', iter, x, f(x), err);
end

% Print the final result
fprintf('La raíz aproximada es / The approximate root is x = %f\n', x);
