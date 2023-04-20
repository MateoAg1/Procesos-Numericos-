% We create an example matrix
A = [2 1 -1 2; -3 -1 2 -3; -2 1 2 -1; 1 -1 1 -1];

% We verify whether the matrix is solvable by the Gaussian elimination method
if det(A) == 0
    disp('La matriz no se puede resolver por eliminación gaussiana / The matrix cannot be solved by Gaussian elimination.');
else
    % We create a copy of the matrix
    B = A;

    % We print the table of the original matrix
    disp('Original Matrix:');
    disp(A);

    % We perform the following Gaussian elimination operations
    for k = 1:size(B,1)-1 % We go through the rows of the matrix
        for i = k+1:size(B,1) % Scroll through the rows below the current row
            factor = B(i,k) / B(k,k); % We calculate the elimination factor
            for j = k:size(B,2) % We scroll through the columns of the current row
                B(i,j) = B(i,j) - factor * B(k,j); % We perform Gaussian elimination
            end
        end
        
        % We print the table of the copy matrix
        disp(['Matriz después de la iteración / Matrix after iteration ', num2str(k), ':']);
        disp(B);
    end

    % We print the system solution
    disp('La solución del sistema es / The solution of the system is:');
    disp(B(:,end) ./ diag(B));
end
