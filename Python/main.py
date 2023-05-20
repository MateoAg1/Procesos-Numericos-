import numpy as np

def cubic_spline(x, y):
    n = len(x)
    h = np.diff(x)
    b = np.zeros(n)
    u = np.zeros(n)
    v = np.zeros(n)
    z = np.zeros(n)

    for i in range(1, n-1):
        b[i] = 2.0 * (h[i-1] + h[i])
        u[i] = 6.0 * ((y[i+1] - y[i]) / h[i] - (y[i] - y[i-1]) / h[i-1])

    for i in range(1, n-1):
        factor = h[i-1] / b[i-1]
        b[i] -= factor * h[i-1]
        u[i] -= factor * u[i-1]

    z[n-2] = u[n-2] / b[n-2]

    for i in range(n-3, 0, -1):
        z[i] = (u[i] - h[i] * z[i+1]) / b[i]

    a = y[:-1]
    c = np.zeros(n-1)
    d = np.zeros(n-1)

    for i in range(0, n-1):
        h_i = h[i]
        c[i] = (z[i+1] - z[i]) / (6.0 * h_i)
        d[i] = z[i] / 2.0
        b_i = (y[i+1] - y[i]) / h_i - h_i * (2 * z[i] + z[i+1]) / 6.0
        a_i = y[i]
        print(f"S{i+1}(x) = {a_i} + {b_i}(x - {x[i]}) + {c[i]}(x - {x[i]})^2 + {d[i]}(x - {x[i]})^3")

# Ejemplo de uso
x = np.array([0, 1, 2, 3, 4])  # Valores x
y = np.array([0, 1, 0, 1, 0])  # Valores y

cubic_spline(x, y)
