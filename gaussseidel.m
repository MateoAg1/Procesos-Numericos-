function [x, rho] = gaussseidel(A, b, x, tol, Nm)
    n = length(x);
    tabla1 = zeros(Nm, n+1);  % Tabla para almacenar los resultados de las iteraciones

    for k = 1:Nm
        w = x;
        for i = 1:n
            s1 = A(i, 1:i-1) * x(1:i-1);
            s2 = A(i, i+1:n) * x(i+1:n);
            s = s1 + s2;
            x(i) = (b(i) - s) / A(i, i);
        end

        tabla1(k, :) = [k, x'];  % Almacenar los resultados de la iteración en la tabla

        if norm(x - w, "inf") < tol
            break;
        end
    end

    [~, rho] = eigs(A, 1);  % Calcular el radio espectral

    % Imprimir la tabla de iteraciones
    fprintf('Tabla de Iteraciones:\n');
    fprintf('Iteracion\t');
    for i = 1:n
        fprintf('x(%d)\t\t', i);
    end
    fprintf('\n');
    for k = 1:min(k, Nm)
        fprintf('%d\t\t', tabla1(k, 1));
        for i = 2:(n+1)
            fprintf('%6.7f\t', tabla1(k, i));
        end
        fprintf('\n');
    end
end

            


       

            
       
       