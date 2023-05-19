% Tabla de valores / Value Table
x = [-1, 0, 3, 4];
y = [15.5, 3, 8, 1];

% Número de puntos / Points Number
n = length(x);

% Coeficientes de los trazadores / Spline Coeficents
a = zeros(n-1, 1);
b = zeros(n-1, 1);

% Calcular los coeficientes / Calculate the Coeficents
for i = 1:n-1
    a(i) = (y(i+1) - y(i)) / (x(i+1) - x(i));
    b(i) = y(i) - a(i) * x(i);
end

% Imprimir los resultados / Print Results
disp('Resultados:');
for i = 1:n-1
    disp(['Coeficientes de los trazadores ', num2str(i), ':']);
    disp(['a = ', num2str(a(i))]);
    disp(['b = ', num2str(b(i))]);
    disp(' ');
end

% Imprimir los trazadores / Print Splines
disp('Trazadores:');
for i = 1:n-1
    disp([ num2str(i), ':']);
    disp(['y = ', num2str(a(i)), ' * x + ', num2str(b(i))]);
end
