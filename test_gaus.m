seg = [1 10];
alpha = 1;
beta = -1;
f = @(x) (x.^2 + x + 1);
w_f =@(x)(seg(2) - x)./(x - seg(1));
gaus(f, w_f, 3, seg)