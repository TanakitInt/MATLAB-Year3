% degrad5_9.m

% --- Iterative Nonliner Restoration Using the
%     Lucy-Richarson Algorithm ---

clear all;
close all;

f = checkerboard(8);
figure(1); imshow(im2uint8(mat2gray(f)));
figure(2); imshow(pixeldup(f, 8));

PSF = fspecial('motion', 7, 10);
SD = 0.01;
g = imnoise(imfilter(f, PSF), 'gaussian', 0, SD^2);

DAMPAR = 10*SD;
LIM = ceil(size(PSF, 1)/2);
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1:end - LIM, LIM + 1:end - LIM) = 1;
NUMIT = 20;

fr = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
figure(3), imshow(pixeldup(fr, 8));
figure(4), imshow(fr);

