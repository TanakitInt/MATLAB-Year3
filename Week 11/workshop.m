%workshop

clear all;
close all;

f = imread('lena.bmp');
figure(1), imshow(f);

%PSF = fspecial('motion', 7, 45);
%PSF = fspecial('motion', 10, 10);
%PSF = fspecial('motion', 20, 2);
PSF = fspecial('motion', 30, 0);
%PSF = fspecial('motion', 40, 30);
%PSF = fspecial('disk', 5);

g = imfilter(f, PSF, 'circular');
figure(2), imshow(g);

noise = imnoise(zeros(size(f)), 'gaussian', 0, 0.001);
figure(3), imshow(im2uint8(mat2gray(noise)));

figure(4), imshow(pixeldup(f, 2), []);

% ----------- Restoration by Using Direct Inverse Filter Technique 
%             via deconvolutional function (deconvwnr)

frl = deconvwnr(f, PSF);
figure(6), imshow(frl);

Sn = abs(fft2(noise)).^2;           % noise power spectrum
nA = sum(Sn(:))/prod(size(noise));  % noise average power
Sf = abs(fft2(f)).^2;               % image power spectrum
fA = sum(Sf(:))/prod(size(f));      % image average power
R = nA/fA;

fr2 = deconvwnr(g, PSF, R);
figure(7), imshow(im2uint8(mat2gray(fr2)));

% --- Restoration by Using Autocorrelation function ---

NCORR = fftshift(real(ifft2(Sn)));
ICORR = fftshift(real(ifft2(Sf)));
fr3 = deconvwnr(g, PSF, NCORR, ICORR);
figure(8), imshow(im2uint8(mat2gray(fr3)));

% --- Restoration by Using Constrained Least Squares (Regularized)
%     Filtering ----

fr4 = deconvreg(g, PSF, 2);   % noise power is approximately 2
figure(9); imshow(im2uint8(mat2gray(fr4)));

fr5 = deconvreg(g, PSF, 0.4, [1e-7 1e7]);
figure(10); imshow(im2uint8(mat2gray(fr5)));










