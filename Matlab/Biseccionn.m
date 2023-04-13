% Función: f(x)
% Intervalo: [a,b]
% Tolerancia: tol
% Máximo número de iteraciones: maxiter

% Verificar si la función es adecuada para el método de la bisección
if f(a)*f(b) >= 0
    error('La función no cambia de signo en el intervalo dado. El método de la bisección no es adecuado.')
end

% Inicializar variables
iter = 0;
fa = f(a);
fb = f(b);

% Imprimir encabezado de la tabla
fprintf('Iteración \t a \t\t b \t\t c \t\t f(c)\n')

% Bucle principal
while (b-a)/2 > tol && iter < maxiter
    % Calcular punto medio
    c = (a+b)/2;
    fc = f(c);
    
    % Imprimir valores de la iteración actual
    fprintf('%d \t\t %.4f \t %.4f \t %.4f \t %.4f\n', iter, a, b, c, fc)
    
    % Verificar si c es la raíz exacta
    if fc == 0
        break
    end
    
    % Actualizar intervalo
    if fa*fc < 0
        b = c;
        fb = fc;
    else
        a = c;
        fa = fc;
    end
    
    % Incrementar contador de iteraciones
    iter = iter + 1;
end

% Imprimir resultado final
fprintf('Raíz aproximada: %.4f\n', c)
