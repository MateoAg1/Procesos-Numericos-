% Check if the matrix can be solved by the full pivoting method.
A = [1 2 -3; 4 5 6; 7 8 9];
b = [1; 2; 3];
if det(A) == 0
    disp('La matriz no puede ser resuelta por el método de pivoteo total / The matrix cannot be solved by the full pivoting method.');
else
    % Solve the matrix by the total pivoting method.
    Ab = [A b];
    [rref_Ab, pivots] = rref(Ab);
    disp('Matriz aumentada / Augmented matrix:');
    disp(Ab);
    disp('Matriz escalonada reducida por filas / Row-reduced staggered matrix:');
    disp(rref_Ab);
    disp('Pivotes / Pivots:');
    disp(pivots);
    disp('Solución / Solution:');
    disp(rref_Ab(:,end));
end
