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
figure(3); imshow(g)

DAMPAR = 4*SD;
LIM = ceil(size(PSF, 1)/2);
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1:end - LIM, LIM + 1:end - LIM) = 1;
NUMIT = 40;

fr = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
figure(4), imshow(pixeldup(fr, 8));
figure(5), imshow(fr);

