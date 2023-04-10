import numpy as np

def pivoteo_total(A, b):
    """
    Realiza el método de pivoteo total para resolver un sistema de ecuaciones lineales de la forma Ax = b.
    A es una matriz cuadrada y b es un vector columna.
    """

    # Verifica que A sea una matriz cuadrada
    m, n = A.shape
    if m != n:
        print("La matriz no es cuadrada.")
        return None

    # Verifica que el sistema tenga solución única
    det = np.linalg.det(A)
    if det == 0:
        print("El sistema no tiene solución única.")
        return None

    # Concatena la matriz A y el vector b en una matriz ampliada
    Ab = np.concatenate((A, b), axis=1)
    Ab = Ab.astype(float)

    # Realiza el pivoteo total
    for i in range(n):
        # Encuentra el índice del elemento máximo en la submatriz Ab[i:, i:]
        max_index = np.unravel_index(np.abs(Ab[i:, i:]).argmax(), Ab[i:, i:].shape)
        max_row, max_col = max_index[0] + i, max_index[1] + i
        
        # Intercambia filas si es necesario
        if max_row != i:
            Ab[[i, max_row], :] = Ab[[max_row, i], :]
        
        # Intercambia columnas si es necesario
        if max_col != i:
            Ab[:, [i, max_col]] = Ab[:, [max_col, i]]
        
        # Normaliza la fila pivote
        pivot = Ab[i, i]
        Ab[i, :] /= pivot
        
        # Elimina los elementos debajo del pivote
        for j in range(i+1, n):
            factor = Ab[j, i]
            Ab[j, :] -= factor * Ab[i, :]
        
        # Elimina los elementos encima del pivote
        for j in range(i):
            factor = Ab[j, i]
            Ab[j, :] -= factor * Ab[i, :]

    # Calcula los valores de x mediante sustitución hacia atrás
    x = np.zeros(n)
    for i in range(n-1, -1, -1):
        x[i] = Ab[i, n] / Ab[i, i]
        for j in range(i-1, -1, -1):
            Ab[j, n] -= Ab[j, i] * x[i]

    # Imprime la matriz ampliada y el resultado de x
    print("Matriz ampliada:\n", Ab)
    print("Solución x:\n", x)

A = np.array([[2, 1, -1], [4, -1, 1], [1, -1, 2]])
b = np.array([[8], [3], [7]])

pivoteo_total(A, b)
