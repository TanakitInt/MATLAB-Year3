%f = imread('Fig0926(a)(rice).tif');
f = imread('Fig1017(a)(cygnusloop_Xray_original).tif');

figure(1); imshow(f);


se = strel('disk', 10);
fo = imopen(f, se);     % Image Opening

figure(2); imshow(fo);


To = graythresh(fo);    % Global Thresholding
T = fo +(To*255);       % Local Thresholding

figure(3); imshow(T);


[m, n] = size(f);
out = zeros(m, n);
out_idx = find(f >= T);
out(out_idx) = 1;

figure(4); imshow(out);

