n = linspace(1,100);
x_n = zeros(1,100);
Ts = 0.05; %1/f = 1/20

% for a -----------------------------------------------------
for i = 1:100
    x_n(i) = cos(2*pi* (n(i)-1) * Ts);
end

figure(1)
plot(n,x_n);
xlabel('n');
ylabel('x_n');
title('n vs. x_n');

% for b -----------------------------------------------------
[b_1,a_1] = butter(3,0.05);
[H_1,w] = freqz(b_1,a_1); %k??????????
P_1 = angle(H_1);
H_1 = 20*log10(abs(H_1)); %vector可以直接做scale
y_1 = filter(b_1,a_1,x_n);

figure(2)
subplot(3,3,1)
plot(w,H_1);

subplot(3,3,2)
plot(w,P_1*180/pi);

subplot(3,3,3)
plot(n,y_1);

% for c ---------------------------------------------------
[b_2,a_2] = butter(7,0.05);
[H_2,w] = freqz(b_2,a_2);
P_2 = angle(H_2);
H_2 = 20*log10(abs(H_2)); 
y_2 = filter(b_2,a_2,x_n);

subplot(3,3,4)
plot(w,H_2);

subplot(3,3,5)
plot(w,P_2*180/pi);

subplot(3,3,6)
plot(n,y_2);

% for d --------------------------------------------------
[b_3,a_3] = butter(3,0.5);
[H_3,w] = freqz(b_3,a_3); 
P_3 = angle(H_3);
H_3 = 20*log10(abs(H_3));
y_3 = filter(b_3,a_3,x_n);

subplot(3,3,7)
plot(w,H_3);

subplot(3,3,8)
plot(w,P_3*180/pi);

subplot(3,3,9)
plot(n,y_3);
