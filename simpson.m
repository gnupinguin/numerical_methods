
function I = simpson(fun, segment, steps, accuracy)
    N = 0;
    if nargin == 3
        N = steps;
    else N = nodes_count(fun, segment, accuracy);
    end
    h = (segment(2)-segment(1))/N;
    nodes = [segment(1) + h : h : segment(2)-h];
    I = (h/3)*(fun(segment(1)) + 2*sum(fun(nodes(2:2:end))) + ...
    4*sum(fun(nodes(1:2:end))) + fun(segment(2)));
end

function count = nodes_count(f, segment, accuracy)

    height_derivate = 4;
    x = sym('x');
    f1 = formula(f(x));
    df = diff(f1, height_derivate);
    abs_df = matlabFunction(-abs(df));
    abs_df_max_value = f(fminbnd(abs_df, segment(1), segment(2)));
    N = 2;
    total_accuracy = 2*accuracy;
    
    
    while accuracy <= total_accuracy
        h = (segment(2)-segment(1))/N;
        total_accuracy = (segment(2)-segment(1))*(h^4) * abs_df_max_value/2880;
        N = N + 2;
    end
    
    count = N - 2;    
end

