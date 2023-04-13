% Verificar si la función es adecuada para el método de la secante
% La función f(x) = x^2 - 2 es continua y diferenciable en el intervalo [1, 2]
% Además, hay un cambio de signo en el intervalo, lo que indica que hay una raíz en el intervalo
% Por lo tanto, el método de la secante es adecuado para esta función en este intervalo

% Definir la función 
f = @(x) x^2 - 2;

% Definir los valores iniciales
x0 = 1;
x1 = 1.5;

% Definir la precisión deseada y el número máximo de iteraciones
tolerance = 1e-6;
max_iterations = 100;

% Crear una tabla vacía para almacenar los valores iterativos
iteration_table = [];

% Implementar el método de la secante
i = 0;
while abs(x1 - x0) > tolerance && i < max_iterations
    i = i + 1;
    x2 = x1 - ((f(x1) * (x1 - x0)) / (f(x1) - f(x0)));
    iteration_table = [iteration_table; i, x0, x1, x2, f(x2)];
    x0 = x1;
    x1 = x2;
end

% Imprimir la tabla de valores iterativos
fprintf('Iter\t x0\t x1\t x2\t f(x2)\n');
for i = 1:size(iteration_table, 1)
    fprintf('%d\t %.8f\t %.8f\t %.8f\t %.8f\n', iteration_table(i, :));
end

% Imprimir la raíz aproximada
fprintf('\nLa raíz aproximada es x = %.8f\n', x2);
