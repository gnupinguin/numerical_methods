clear all;
 f1 =@(x) cos(3*x) + x.^5;
 f2 =@(x) cos(x).^6 + x + x.^8;
 seg1 = [-2 5];
 seg2 = [-3 7];
 e = 0.001;
 
 etalon = 2593.62312411399;
 N = 2;
 while (etalon - simpson(f1, seg1, N)) > e
     N = N + 2;
 end
 N
 etalon - simpson(f1, seg1, N)
 
 