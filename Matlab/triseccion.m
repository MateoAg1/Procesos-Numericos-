% Definimos la función a utilizar
f = @(x) x^3 + 4*x^2 - 10;

% Definimos el intervalo inicial y la tolerancia
a = 1;
b = 2;
tol = 1e-6;

% Verificamos que la función cambie de signo en el intervalo
if f(a)*f(b) >= 0
    error('La función no cambia de signo en el intervalo')
end

% Inicializamos las variables necesarias
iter = 0;
max_iter = 1000;
c = (a + b) / 2;

% Imprimimos la tabla de resultados
fprintf('Iter\t a\t\t b\t\t c\t\t f(c)\n')

% Aplicamos el método de trisección
while abs(f(c)) > tol && iter < max_iter
    iter = iter + 1;
    if f(c)*f(a) < 0
        b = c;
    else
        a = c;
    end
    c = (a + b) / 2;
    fprintf('%d\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, a, b, c, f(c))
end

% Imprimimos la solución
fprintf('La raíz es: %.6f\n', c)
