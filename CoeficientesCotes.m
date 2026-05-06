function [Den, VetC, Info] = CoeficientesCotes(n)

    Info = 0;

    if n < 1 || n > 10
        Info = -1;
        Den = [];
        VetC = [];
        return
    end

    d = [2 6 8 90 288 840 17280 28350 89600 598752];
    w=calcularPesosNewtonCotes(n);

    Den = d(n);
    c(n)=w/d(n);
    p = floor(n*(n+2)/4) + mod(n,2);
    n12 = floor((n+1)/2) - 1;

    VetC = zeros(1, n+1);

    for i = 0:n12
        VetC(i+1) = c(p+i);
        VetC(n+1-i) = c(p+i);
    end

    if mod(n,2) == 0
        VetC(n/2 + 1) = c(p + n/2);
    end

end
