close all;
clear all;

x = [1, 5];
y = [1, 5];

figure(1);
xlim([0 5]); ylim([0 5]);
hold on;
plot(x, y);

theta = 0:2 * pi/100:2 * pi;
c1 = x(1) * cos(theta) + y(1) * sin(theta);
c2 = x(2) * cos(theta) + y(2) * sin(theta);

figure(2); hold on;
plot(c1); plot(c2);

