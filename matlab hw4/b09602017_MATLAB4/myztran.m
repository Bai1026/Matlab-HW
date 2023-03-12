% ------------------------------------------------------------------- a
a = conv (conv( [1, -0.1-0.1i], [1, -0.1+0.1i]), conv ([1, -0.3-0.4i], [1, -0.3+0.4i]) );
b = 0.09 .* conv (conv([1, 1],[1, 1]), conv([1, -1],[1, -1]) );
figure()
subplot(2,4,1);
zplane(b,a);
title('poles and zeros of H(z)');


% ------------------------------------------------------------------- b
n = linspace(0,20,21);
[r,p,k] = residuez(b, a);

sum = 0;
for i = 1:4
    sum = sum + r(i)*p(i).^(n); 
end
h1 = sum;

h1(1) = h1(1)+k;
h = real(h1);

subplot(2,4,2);
stem(n,h);
xlabel('n');
title('h[n]');


% ------------------------------------------------------------------- c
[H, w] = freqz(b,a,690); %get the response

subplot(2,4,3);
plot(w,abs(H));
xlabel('\omega');
ylabel('magnitude');
title('magnitude vs \omega');

subplot(2,4,4);
plot(w,angle(H)*180/pi);
xlabel('\omega');
ylabel('phase');
title('phase vs \omega');


% ------------------------------------------------------------------- d
sos = zp2sos([1,1,-1,-1],[0.3+0.4i,0.3-0.4i,0.1+0.1i,0.1-0.1i],0.09);

[H1, w1] = freqz([0.09,0.18,0.09],[1,-0.2,0.02], 690);
[H2, w2] = freqz([1,-2,1],[1,-0.6,0.25], 690);


% ------------------------------------------------------------------- e
subplot(2,4,5);
plot(w1, abs(H1));
xlabel('\omega');
ylabel('magnitude(H_1(z))');
title('magnitude vs \omega');

subplot(2,4,6);
plot(w2, abs(H2));
xlabel('\omega');
ylabel('magnitude(H_2(z))');
title('magnitude vs \omega');

H_z = abs(H1).*abs(H2);

subplot(2,4,7);
plot(w1,H_z);
xlabel('\omega');
ylabel('magnitude')
title('magnitude of H_1(z)*H_2(z) vs \omega');


% ------------------------------------------------------------------- f
x = zeros(1,21); % 0~20
x(1) = 1; % while n = 0
y = filter(b,a,x);

subplot(2,4,8);
stem(n,y);
xlabel('n');
ylabel('y[n]');
title('y[n] vs n');
