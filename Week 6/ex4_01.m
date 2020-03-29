clear all;
close all;

f = zeros(256, 256); % black image size 256*256
f(128-15:128+15, 128-15:128+15) = 1;
figure(1);
imshow(f);

F = fft2(double(f)); % fourier transform
figure(2);
imshow(abs(F), []);

Fc = fftshift(F); % shift transform
figure(3);
imshow(abs(Fc), []);

figure(6);
mesh(abs(Fc)); % 3D plot for figure 3

S2 = log(1+abs(Fc)); % shifted sum equation transfrom
figure(4);
imshow(abs(S2), []);

figure(5); % 3D plot for figure 2
mesh(abs(F));

