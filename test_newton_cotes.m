
seg = [1 10];
alpha = 1;
beta = -1;
f = @(x) (x.^2 + x + 1);
w_f =@(x)(seg(2) - x)./(x - seg(1));
e = 10^(-3);
newton_cotes(f,w_f, seg, 3)
