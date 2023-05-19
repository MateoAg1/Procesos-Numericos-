function jacobi(A, b, x0, tolerance, max_iterations)
    n = length(b);
    
    % Inicialización de variables
    x = x0;
    error = inf;
    iteration = 0;
    
    % Calcula la matriz T y el vector C
    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);
    T = -inv(D) * (L + U);
    C = inv(D) * b;
    
    % Calcula el radio espectral
    spectral_radius = max(abs(eig(T)));
    
    % Imprime la matriz T, vector C y el radio espectral
    disp('Matriz T:');
    disp(T);
    disp('Vector C:');
    disp(C);
    disp('Radio espectral:');
    disp(spectral_radius);
    
    % Imprime la tabla de iteraciones, errores y soluciones de x
    fprintf('\nIteración\tError\t\tSolución x\n');
    
    % Iteraciones del método de Jacobi
    while error > tolerance && iteration < max_iterations
        x_prev = x;
        
        % Cálculo de la solución en la iteración actual
        for i = 1:n
            x(i) = T(i,:) * x_prev + C(i);
        end
        
        % Cálculo del error
        error = norm(x - x_prev);
        
        % Imprime los resultados de la iteración actual
        fprintf('%d\t\t%f\t', iteration, error);
        
        % Imprime las soluciones de x de forma horizontal
        fprintf('%f\t', x);
        fprintf('\n');
        
        iteration = iteration + 1;
    end
    
    % Verifica si se alcanzó la tolerancia o el número máximo de iteraciones
    if error <= tolerance
        fprintf('\nSe alcanzó la tolerancia de %f en %d iteraciones.\n', tolerance, iteration);
    else
        fprintf('\nEl método no convergió en %d iteraciones.\n', max_iterations);
    end
end
