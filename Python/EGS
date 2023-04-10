import numpy as np

def eliminacion_gaussiana(A, b):
    """
    Realiza la eliminación gaussiana simple para resolver un sistema de ecuaciones lineales de la forma Ax = b.
    A es una matriz cuadrada y b es un vector columna.
    """

    # Verifica que A sea una matriz cuadrada
    m, n = A.shape
    if m != n:
        print("La matriz no es cuadrada.")
        return None

    # Concatena la matriz A y el vector b en una matriz ampliada
    Ab = np.concatenate((A, b), axis=1)
    Ab = Ab.astype(float)

    
  
  # Imprime la matriz ampliada original
    print("Matriz ampliada original:")
    print(Ab)

    # Itera sobre cada fila de la matriz ampliada
    for i in range(n):
        # Si el elemento diagonal es cero, intercambia filas para evitar la división por cero
        if Ab[i, i] == 0:
            for j in range(i+1, n):
                if Ab[j, i] != 0:
                    Ab[[i, j]] = Ab[[j, i]]
                    break

        # Divide la fila actual por el elemento diagonal
        divisor = Ab[i, i]
        Ab[i, :] /= divisor

        # Imprime la matriz ampliada después de dividir la fila actual
        print("Después de dividir la fila {}:".format(i+1))
        print(Ab)

        # Itera sobre todas las filas debajo de la fila actual
        for j in range(i+1, n):
            # Multiplica la fila actual por el elemento debajo del elemento diagonal y resta la fila resultante de la fila debajo
            factor = Ab[j, i]
            Ab[j, :] -= factor * Ab[i, :]

            # Imprime la matriz ampliada después de restar la fila resultante
            print("Después de restar {} veces la fila {} de la fila {}:".format(factor, i+1, j+1))
            print(Ab)

    # Calcula los valores de x mediante sustitución hacia atrás
    x = np.zeros(n)
    for i in range(n-1, -1, -1):
        x[i] = Ab[i, n]
        for j in range(i+1, n):
            x[i] -= Ab[i, j] * x[j]

    # Imprime el resultado final de x
    print("La solución es x = {}".format(x))

# Define la matriz A y el vector b
A = np.array([[2, 1, -1],
              [4, 1, 1],
              [-2, 2, 1]])
b = np.array([[8], [10], [-3]])

# Llama a la función eliminacion_gaussiana y pasa la matriz A y el vector b
eliminacion_gaussiana(A, b)
