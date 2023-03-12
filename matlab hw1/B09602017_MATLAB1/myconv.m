%A小題
x1 = (1:39);
x1(21:39) = 19:-1:1;
figure()
stem(x1)
xlabel('n')
xlim([-10,50])
title("x1[n] vs n")

x2 = ones(1,11);
figure()
stem(x2)
xlabel('n')
xlim([-4,15])
ylim([0,1.5])
title("x2[n] vs n")

%B小題
y = conv(x1,x2);
figure()
stem(y)
xlabel('n')
title("y[n] vs n (convolution)")

%C小題
M1 = zeros([49 11]);
x1_tom1 = transpose(x1);  
n=1;
while(n < 12) %做到40
    M1(n:n+38,n) = x1_tom1;
    n = n+1;
end

M2 = ones(11,1);

M3 = M1*M2;
figure
stem(M3)
xlabel('n')
title("y[n] vs n (matrix)")

% D小題
x3 = [3 12 39];
figure
stem(x3)
xlim([0,4])
xlabel('n')
title("x3[n] vs n")

x4 = [2 6 14 30 62];
figure
stem(x4)
xlim([0,6])
xlabel('n')
title("x4[n] vs n")

y2 = conv(x3,x4);
figure
stem(y2)
xlabel('n')
title("y2[n] vs n(convolution)")

% for matrix form
M4 = zeros([7 5]);
x3_tom1 = transpose(x3);  
n=1;
while(n < 6) %做到40
    M4(n:n+2,n) = x3_tom1;
    n = n+1;
end

M5 = transpose(x4);

M6 = M4*M5;
figure
stem(M6)
xlabel('n')
title("y2[n] vs n (matrix)")
