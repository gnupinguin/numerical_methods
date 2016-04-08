function I = gaus(fun, weight_fun, nodes_count, segment)
    syms x;
    n = nodes_count;
    w_fun = formula(weight_fun(x));
    moments = int(w_fun*x.^[1 : 2*n])%add segment
    
    b = transp(moments(n+1:end))
    A = [];
    for j = 1:nodes_count
        A = horzcat(A, moments((1:nodes_count)+j));
    end
    a = A\b
end