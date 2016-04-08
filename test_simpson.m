clear all;
 f1 =@(x) cos(3*x) + x.^5;
 f2 =@(x) cos(x).^6 + x + x.^8;
 seg1 = [-2 5];
 seg2 = [-3 7];
 e = 0.001;
 
 %for first function
 etalon1 = 2593.62312411399;
 N = 2;
 while abs(etalon1 - simpson(f1, seg1, N)) > e
     N = N + 2;
 end
 disp('Count of nodes: ');
 disp(N);
 disp('Method error:');
 disp(abs(etalon1 - simpson(f1, seg1, N)));
 disp('Value: ');
 disp(simpson(f1, seg1, N));

 
  %for second function
 etalon2 = 4485944.3817;
 N = 2;
 while abs(etalon2 - simpson(f2, seg2, N)) > e
     N = N + 2;
 end
 disp('Count of nodes: ');
 disp(N);
 disp('method error:');
 disp(abs(etalon2 - simpson(f2, seg2, N)));
 disp('Value: ');
 disp(simpson(f2, seg2, N));
 
 

 
 
 