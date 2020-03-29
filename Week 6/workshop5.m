clear all;
close all;

RGB_f1 = imread('SQ.png');
f1 = rgb2gray(double(RGB_f1));
F1 = fft2(f1);
F1 = fftshift(F1); % fourier transform
figure(1); imshow(abs(F1));

RGB_f2 = imread('Reg_0.png');
f2 = rgb2gray(double(RGB_f2));
F2 = fft2(f2); % fourier transform
figure(2); imshow(F2);

RGB_f3 = imread('Reg_90.png');
f3 = rgb2gray(double(RGB_f3));
F3 = fft2(f3); % fourier transform
figure(3); imshow(F3);

RGB_f4 = imread('c0.png');
f4 = rgb2gray(double(RGB_f4));
F4 = fft2(f4); % fourier transform
figure(4); imshow(F4);

RGB_f5 = imread('c1.png');
f5 = rgb2gray(double(RGB_f3));
F5 = fft2(f5); % fourier transform
figure(5); imshow(F5);

RGB_f6 = imread('c2.png');
f6 = rgb2gray(double(RGB_f6));
F6 = fft2(f6); % fourier transform
figure(6); imshow(F6);

RGB_f7 = imread('c3.png');
f7 = rgb2gray(double(RGB_f7));
F7 = fft2(f7); % fourier transform
figure(7); imshow(F7);

RGB_f8 = imread('c4.png');
f8 = rgb2gray(double(RGB_f8));
F8 = fft2(f8); % fourier transform
figure(8); imshow(F8);

RGB_f9 = imread('c5.png');
f9 = rgb2gray(double(RGB_f9));
F9 = fft2(f9); % fourier transform
figure(9); imshow(F9);
