%f = imread('Fig0911(a)(noisy-fingerprint).tif');
f = imread('Fig0916(a)(bone).tif')

se = strel('square', 3);
fo = imopen(f, se);
foc = imclose(fo, se);
g1 = bwmorph(foc, 'thin', 1);
g2 = bwmorph(foc, 'thin', 2);
ginf = bwmorph(foc, 'thin', Inf);

figure(1);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(foc);
subplot(2, 2, 3); imshow(g1);
subplot(2, 2, 4); imshow(g2);

figure(2); imshow(ginf);

