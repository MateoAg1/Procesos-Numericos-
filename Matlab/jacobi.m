function jacobi(A, b, x0, tolerance, max_iterations)
    n = length(b);
    
    % Inicialización de variables / Variable Initialization
    x = x0;
    error = inf;
    iteration = 0;
    
    % Calcula la matriz T y el vector C / Calculate Matrix T and C Vector
    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);
    T = -inv(D) * (L + U);
    C = inv(D) * b;
    
    % Calcula el radio espectral / Calculate Spectral Radius
    spectral_radius = max(abs(eig(T)));
    
    % Imprime la matriz T, vector C y el radio espectral / Print Matrix T, C Vector and Spectral Radius
    disp('Matriz T:');
    disp(T);
    disp('Vector C:');
    disp(C);
    disp('Radio espectral:');
    disp(spectral_radius);
    
    % Imprime la tabla de iteraciones, errores y soluciones de x / Print Iteration Table 
    fprintf('\nIteración\tError\t\tSolución x\n');
    
    % Iteraciones del método de Jacobi / Jacobi´s Method Iterations
    while error > tolerance && iteration < max_iterations
        x_prev = x;
        
        % Cálculo de la solución en la iteración actual / Calculate Actual Solution in the Interation
        for i = 1:n
            x(i) = T(i,:) * x_prev + C(i);
        end
        
        % Cálculo del error / Error Calculation
        error = norm(x - x_prev);
        
        % Imprime los resultados de la iteración actual / Print Actual Results
        fprintf('%d\t\t%f\t', iteration, error);
        
        % Imprime las soluciones de x de forma horizontal / Print Solutions
        fprintf('%f\t', x);
        fprintf('\n');
        
        iteration = iteration + 1;
    end
end
