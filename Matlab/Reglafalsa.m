% Función a evaluar
f = @(x) x^3 - 2*x - 5;

% Intervalo de interés
a = 2;
b = 3;

% Verificar que la función tenga signos opuestos en los extremos del intervalo
if f(a)*f(b) > 0
    error('La función no cambia de signo en el intervalo dado');
end

% Criterio de parada
tol = 1e-6; % Tolerancia
maxiter = 100; % Número máximo de iteraciones

% Inicialización de variables
iter = 0;
x = a;
fa = f(a);
fb = f(b);

% Tabla de resultados
fprintf('iter \t a \t\t b \t\t x \t\t f(a) \t\t f(b) \t\t f(x) \n');

% Implementación del método de la regla falsa
while abs(f(x)) > tol && iter < maxiter
    iter = iter + 1;
    x = (a*fb - b*fa)/(fb - fa);
    fx = f(x);
    
    % Mostrar resultados en cada iteración
    fprintf('%d \t %f \t %f \t %f \t %f \t %f \t %f \n', iter, a, b, x, fa, fb, fx);
    
    % Actualización de los valores
    if fx*fa < 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end
end

% Resultado final
if abs(f(x)) <= tol
    fprintf('\nLa raíz aproximada es x = %f con un error de %f\n', x, abs(f(x)));
else
    fprintf('\nNo se encontró una raíz en %d iteraciones\n', maxiter);
end
