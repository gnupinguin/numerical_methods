% weighting function equals 1(p(x)=1)
function I = newton_cotes(fun, segment, accuracy)
    syms t;
    
    coefficients = 0;% quadrature coefficients
    error = 2*accuracy;
    n = 1;
    while error > accuracy
        n = n+1;
        w = (0:-1:-n) + t;
        w = prod(w);% Lagrange multiplier
        k = 0:1:ceil(n/2);
        coefficients = (-1).^(n-k) ./(n*factorial(k).*factorial(n-k))...
            .* int(w./(t-k), 0, n);
        if mod(n, 2) == 1
            coefficients = [coefficients fliplr(coefficients)];
        else
            coefficients = [coefficients fliplr(coefficients(1:end-1))];
        end
        
        error = accuracy*sum(coefficients);
        
    %end
    
    h = diff(segment)/n;
    I = diff(segment)*sum(coefficients.*fun(segment(1):h:segment(2)));
    
    

end