% ---- Sample ---- %
clear all;
close all;

f1 = [1, 1, 1]
F1 = fft(f1);

f10 = [1 1 1 0 0 0 0 0 0 0]
F10 = fft(f10);
figure, steam(abs(F10));

f20 = [1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
F20 = fft(f20);

figure, stem(abs(F20));

% ---- Simulation of ideal FT ---- %
w = 0:2*pi/40:2*pi;
y = exp(-j.*2.*w).*(1+2.*cos(w));
figure, plot(w, abs(y))
