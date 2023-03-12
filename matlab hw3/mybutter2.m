% for a --------------------------------------------
n = linspace(1,1000,1000);
ts = 0.002;
f1 = 100;
M = 1000;
x_n = zeros(1,1000);

for i = 1:M
   x_n(i) = cos(2*pi* (n(i)-1) *ts) + 2*cos(2*pi* f1 * (n(i)-1) * ts);
end

figure()
subplot(3,1,1);
plot(n,x_n);
xlabel('n');
ylabel('x_n');

% for b---------------------------------------------
[b_1,a_1] = butter(16,0.3,'low'); %cutoff freq??
y_1 = filter(b_1, a_1, x_n);

subplot(3,1,2);
plot(n,y_1);
xlabel('n');
ylabel('y_1');

% for c----------------------------------------------
[b_2,a_2] = butter(8,[0.25 0.5],'bandpass'); %cutoff freq??
y_2 = filter(b_2, a_2, x_n);

subplot(3,1,3);
plot(n,y_2);
xlabel('n');
ylabel('y_2');

