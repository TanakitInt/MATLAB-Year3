% workshop -------------

% show original image
f = imread('Fig0930(a)(calculator).tif');
figure(1); imshow(f); 

f_obr = imreconstruct(imerode(f, ones(1, 84)), f);
f_thr = imsubtract(f, f_obr);

g_obr = imreconstruct(imerode(f_thr, ones(1, 10)), f_thr);
g_obrd = imdilate(g_obr, ones(1, 16));

f2 = imreconstruct(min(g_obrd, f_thr), f_thr);

figure(1);
subplot(2, 2, 1); imshow(f_obr);
subplot(2, 2, 2); imshow(f_thr);
subplot(2, 2, 3); imshow(g_obr);
subplot(2, 2, 4); imshow(f2);

