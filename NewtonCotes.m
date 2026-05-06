function [Integral, Info] = NewtonCotes(a, b, n, m)

    Integral = 0;
    Info = 0;

    if n < 1 || n > 10
        Info = -1;
    end

    [Den, VetC, InfoC] = CoeficientesCotes(n);
    Info = Info + InfoC;

    if m < 0 || mod(m,n) ~= 0
        Info = Info - 10;
    end

    if Info ~= 0
        return
    end

    h = (b - a)/m;
    j = 0;

    for i = 0:m
        x = a + i*h;
        y = fun(x);

        j = j + 1;
        k = VetC(j);

        if mod(i,n) == 0 && i ~= 0 && i ~= m
            k = 2*k;
            j = 1;
        end

        Integral = Integral + y*k;
    end

    Integral = (n*h/Den) * Integral;

end
