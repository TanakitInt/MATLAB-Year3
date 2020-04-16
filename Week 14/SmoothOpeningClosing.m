f = imread('Fig0925(a)(dowels).tif');
se = strel('diamond', 5);
fo = imopen(f, se);
foc = imclose(fo, se);

figure(1); imshow(f);
figure(2); imshow(fo);
figure(3); imshow(foc);

%---------------------------

f = imread('Fig0925(a)(dowels).tif');
fasf = f;

for k = 2 : 5
    se = strel('disk', k);
    fasf = imclose(imopen(fasf, se), se);
end

figure(4); imshow(fasf);

