function cubic_spline(x, y)
    n = length(x);
    h = diff(x);
    b = zeros(n, 1);
    u = zeros(n, 1);
    v = zeros(n, 1);
    z = zeros(n, 1);

    for i = 2:n-1
        b(i) = 2 * (h(i-1) + h(i));
        u(i) = 6 * ((y(i+1) - y(i)) / h(i) - (y(i) - y(i-1)) / h(i-1));
    end

    for i = 2:n-1
        factor = h(i-1) / b(i-1);
        b(i) = b(i) - factor * h(i-1);
        u(i) = u(i) - factor * u(i-1);
    end

    z(n-1) = u(n-1) / b(n-1);

    for i = n-2:-1:1
        z(i) = (u(i) - h(i) * z(i+1)) / b(i);
    end

    a = y(1:end-1);
    c = zeros(n-1, 1);
    d = zeros(n-1, 1);

    for i = 1:n-1
        h_i = h(i);
        c(i) = (z(i+1) - z(i)) / (6 * h_i);
        d(i) = z(i) / 2;
        b_i = (y(i+1) - y(i)) / h_i - h_i * (2 * z(i) + z(i+1)) / 6;
        a_i = y(i);
        fprintf('S%d(x) = %.4f + %.4f*(x - %.4f) + %.4f*(x - %.4f)^2 + %.4f*(x - %.4f)^3\n', ...
            i, a_i, b_i, x(i), c(i), x(i), d(i), x(i));
    end
end


