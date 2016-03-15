seg = [1 10];
alpha = 1;
beta = -1;
f = @(x) (x.^2 + x + 1).*(seg(2) - x)./(x - seg(1));
e = 10^(-3);

rectangles_method(f, seg, e)