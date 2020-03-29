% degrad5_10.m

% --- Blind Deconvolution ---

clear all;
close all;

f = checkerboard(8);

%figure(1), imshow(pixeldup(f, 8), []);
figure(1), imshow(f);

PSF = fspecial('gaussian', 5, 45);
figure(2), imshow(pixeldup(PSF, 73), []);
figure(3), imshow(PSF);
SD = 0.05;
g = imnoise(imfilter(f, PSF), 'gaussian', 0, SD^2);
figure(4), imshow(g);

INITPSF = ones(size(PSF));
NUMIT = 100;
DAMPAR = 10*SD;
LIM = ceil(size(PSF, 1)/2);
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1:end - LIM, LIM + 1:end - LIM) = 1;
[fr, PSFs] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);
figure(5), imshow(fr);

