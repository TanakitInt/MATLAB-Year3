clear all;
close all;

%f = imread('building.tif');
f = imread('lena.bmp');

%f = f(1:512, 1:512);
figure(1), imshow(f);
sz = size(f);

C = [6 32]; % Assign locations of noise spectrum
[r, R, S] = imnoise3(sz(1), sz(2), C);   
figure(2); imshow(r, []);    % Show Periodic noise in spatial domain
figure(3); imshow(S, []);    % Show locations of noise spectrum

fn = (double(f) + (mat2gray(r).*255))./2; % Add noise into an image
figure(4), imshow(fn, []);

PQ = paddedsize(size(fn));
FN = fft2(fn, PQ(1), PQ(2));

FNs = fftshift(FN);
FNlog = log(1 + FNs);
figure(5), imshow(uint8(abs(FNlog)), []);

[H D] = notchfilt('notch', sz(1), sz(2), 5, 8);
H1 = fftshift(H);
figure(6), imshow(uint8(H1.*255), []);

g = dftfilt(fn, H);
figure(7), imshow(uint8(g), []);

