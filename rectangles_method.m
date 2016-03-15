%middle rectangles method for the definite integral
function I = rectangles_method(fun, segment, accuracy)
   n = nodes_count(fun, segment, accuracy); %count
   h = (segment(2)-segment(1))/n; %step
   nodes = segment(1):h:segment(2);
   I = sum( fun((nodes(2:end) + nodes(1:end-1))/2)...
      .* diff(nodes));
  
end

function count = nodes_count(fun, segment, accuracy)
    error_const = 24;
    height_derivate = 2;
    x = sym('x');
    f = formula(fun(x));
    df = diff(f, height_derivate);
    %df_reverse_anonymous = matlabFunction((-1)*df);
    df_mid_value = subs(df, (segment(2)- segment(1))/2);
    count = 0;
    total_accuracy = 2 * accuracy;
    
    while total_accuracy > accuracy
        count = count + 1;
        step = (segment(2) - segment(1))/count;
        total_accuracy = abs (df_mid_value * (segment(2) - segment(1))...
            * (step^2) / error_const);
    end
end