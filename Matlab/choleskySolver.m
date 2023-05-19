function x = cholesky(A, b)
    n = size(A, 1);
    L = zeros(n);
    
    % Descomposición de Cholesky
    for i = 1:n
        for j = 1:i
            if i == j
                L(i, j) = sqrt(A(i, i) - sum(L(i, 1:j-1).^2));
            else
                L(i, j) = (A(i, j) - sum(L(i, 1:j-1).*L(j, 1:j-1))) / L(j, j);
            end
        end
    end
    
    % Sustitución hacia adelante (Ly = b)
    y = zeros(n, 1);
    for i = 1:n
        y(i) = (b(i) - L(i, 1:i-1)*y(1:i-1)) / L(i, i);
    end
    
    % Sustitución hacia atrás (L'x = y)
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (y(i) - L(i+1:n, i)'*x(i+1:n)) / L(i, i);
    end
    
    disp('Matriz A:');
    disp(A);
    disp('Matriz L:');
    disp(L);
    disp('Vector b:');
    disp(b);
    disp('Solución x:');
    disp(x);
end

    