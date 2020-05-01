close all;
clear all;

x = [1, 3, 5];
y = [1, 3, 5];

figure(1);
xlim([1 5]); ylim([1 5]);
hold on;
plot(x, y);

theta = 0:2 * pi/100:2 * pi;
c1 = x(1) * cos(theta) + y(1) * sin(theta);
c2 = x(2) * cos(theta) + y(2) * sin(theta);
c3 = x(3) * cos(theta) + y(3) * sin(theta);

figure(2); hold on;
plot(c1); plot(c2); plot(c3);

