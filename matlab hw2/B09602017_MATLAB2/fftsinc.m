% for a-----------------------------------------------------
N1 = 500;
N = 1001;
t = 100;

n = linspace(-N1, N1, N); % n is -500 ~ 500
x = zeros(1, N);
ts = t / N1;

for i = 1:N
   x(i) = sinc(2 * n(i) * ts); 
end

figure()
plot(n,x);
xlabel('n');
ylabel('x[n]');
title("x[n] vs. n");

% for b------------------------------------------------------
X = fftshift(fft(x));
X = abs(X); % for after fft is complex
omega = linspace(-N1*2*pi/N, N1*2*pi/N, N); % by fornula

figure()
plot(omega, X);
xlabel('\omega');
ylabel("fft of x[n]");
title('fft ouput vs. \omega');

% for c------------------------------------------------------
X_k = zeros(1, N);

for k = 1:N
    for j = 1:N             %can't use n here -> 會改到值
        X_k(k) = X_k(k) + x(j) * exp(-1i * (2*pi/N) * (j-1) * (k-1));
    end
end

X_k = abs(fftshift(X_k));

figure()
plot(omega,X_k);
xlabel('\omega');
ylabel('X_k[n]');
title('X_k[n] vs. \omega');

% part 2 -------------------------------------------------------
% for d------------------------------------------------------
T_w = t/2;
w = zeros(1, N);

for t = -N1:N1
    if abs(t * ts) <= T_w/2
          w(t + N1 + 1) = (1 + cos((2*pi/T_w) * abs(t*ts))) / 2;
    end
end

figure()
plot(n,w);
xlabel('n');
ylabel('w[n]');
title('w[n] vs. n');

% for e------------------------------------------------------
y = zeros(1, N);

for i = 1:N
    y(i) = x(i) * w(i);
end

figure()
plot(n,y);
xlabel('n');
ylabel('y[n]');
title('y[n] vs. n');

% for f------------------------------------------------------
Y = fft(y);
Y = fftshift(Y);

figure()
plot(omega,abs(Y));
xlabel('\omega');
ylabel('fft of y[n]');
title('fft of y[n] vs. \omega');
