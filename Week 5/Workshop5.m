%---- Convolutional calculation ----

u = [-1 -1 -1
     -1 8 -1
     -1 -1 -1];

v = [1 1 1 1 1 1 1 1
     1 1 1 1 1 1 1 1
     1 1 1 1 1 1 0 0
     1 1 1 1 1 0 0 0
     1 1 1 1 0 0 0 0
     1 1 1 0 0 0 0 0
     1 1 0 0 0 0 0 0
     1 0 0 0 0 0 0 0];

w = conv2(u, v);

w

%---- Filter Image using conv2 ----


I = imread('Fig0206(a)(rose-original).tif');

J = imfilter(I, u, 'conv');

figure(1);
subplot(1,2,1); imshow(I);
subplot(1,2,2); imshow(J);

