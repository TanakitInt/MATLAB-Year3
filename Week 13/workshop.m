f = imread('Fig0906(a)(broken-text).tif');

se1 = strel('square', 2);
se2 = strel('diamond', 1);
se3 = strel('disk', 1);

% Image Dilation
D1 = imdilate(f, se1);
D2 = imdilate(f, se2);
D3 = imdilate(f, se3);

figure(1);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(D1);
subplot(2, 2, 3); imshow(D2);
subplot(2, 2, 4); imshow(D3);

% Image Erosion
E1 = imerode(f, se1);
E2 = imerode(f, se2);
E3 = imerode(f, se3);

figure(2);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(E1);
subplot(2, 2, 3); imshow(E2);
subplot(2, 2, 4); imshow(E3);

% Image Opening
open1 = imopen(f, se1);
open2 = imopen(f, se2);
open3 = imopen(f, se3);

figure(3);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(open1);
subplot(2, 2, 3); imshow(open2);
subplot(2, 2, 4); imshow(open3);

% Image Closing
c1 = imclose(open1 ,se1);
c2 = imclose(open2 ,se2);
c3 = imclose(open3 ,se3);

figure(4);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(c1);
subplot(2, 2, 3); imshow(c2);
subplot(2, 2, 4); imshow(c3);

