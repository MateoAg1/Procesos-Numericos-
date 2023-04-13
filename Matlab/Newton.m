% Definimos la función y su derivada
f = @(x) x^3 - 2*x - 5;
df = @(x) 3*x^2 - 2;

% Definimos el punto inicial y la tolerancia
x0 = 2;
tol = 1e-6;

% Inicializamos el contador de iteraciones y el error
iter = 0;
err = inf;

% Imprimimos la tabla inicial
fprintf('Iter\t x\t\t f(x)\t\t err\n');
fprintf('%d\t %f\t %e\t %e\n', iter, x0, f(x0), err);

% Iteramos hasta que el error sea menor que la tolerancia
while err > tol
    % Calculamos la siguiente aproximación
    x = x0 - f(x0) / df(x0);
    
    % Calculamos el error relativo
    err = abs((x - x0) / x);
    
    % Actualizamos el punto inicial
    x0 = x;
    
    % Incrementamos el contador de iteraciones
    iter = iter + 1;
    
    % Imprimimos la tabla
    fprintf('%d\t %f\t %e\t %e\n', iter, x, f(x), err);
end

% Imprimimos el resultado final
fprintf('La raíz aproximada es x = %f\n', x);
