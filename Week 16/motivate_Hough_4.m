close all;
clear all;

x = [1, 2, 3, 4, 5];
%y = [1, 2, 3, 4, 5];
y = [5, 4, 3, 2, 1];

figure(1);
xlim([1 5]); ylim([1 5]);
hold on;
plot(x, y);

theta = 0:2 * pi/100:2 * pi;
c1 = x(1) * cos(theta) + y(1) * sin(theta);
c2 = x(2) * cos(theta) + y(2) * sin(theta);
c3 = x(3) * cos(theta) + y(3) * sin(theta);
c4 = x(4) * cos(theta) + y(4) * sin(theta);
c5 = x(5) * cos(theta) + y(5) * sin(theta);

figure(2); hold on;
plot(c1); plot(c2); plot(c3); plot(c4); plot(c5);

