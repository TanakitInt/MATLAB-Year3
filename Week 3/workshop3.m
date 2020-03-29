f = imread('lena.bmp');

imwrite(f, 'lena_jung.bmp')

%code error ----
%imwrite(f, 'lena_lowq5.bmp', 'quality', 5)

imfinfo lena_jung.bmp

% Convert from RGB to Grayscale ----
RGB = imread('lena.jpg');
figure(1); imshow(RGB);

I = rgb2gray(RGB);
figure(2); imshow(I);

% Flip an image ----
J =  imread('lena.bmp');
J2 = flipdim(J ,2);           %# horizontal flip
J3 = flipdim(J ,1);           %# vertical flip
J4 = flipdim(J3,2);    %# horizontal+vertical flip
subplot(2,2,1), imshow(J);
subplot(2,2,2), imshow(J2);
subplot(2,2,3), imshow(J3);
subplot(2,2,4), imshow(J4);

% max main mean of the image
max_value = max(max(f));
min_value = min(min(f));
mean_value = mean(mean(f));

% b is an binary image
b = im2bw(f, 0.5);

figure(3); imshow(b);

% Sum of the image intensity
sum_intensity = sum(f);

% zoom an image
cropped_image = imcrop(f, [32 64 192 216]);

figure(4); imshow(cropped_image);

% rotate image
rotate_stuff = imrotate(f, 90)

figure(5); imshow(rotate_stuff)

% image border
I = imread('lena.bmp');
border = 10;
I(1:border,:,:) = 0;
I(end-border+1:end,:,:) = 0;
I(:,1:border,:) = 0;
I(:,end-border+1:end,:) = 0;

figure(6); imshow(I);

% sliding an image 1


% sliding an image 2


% fill white
imshow(f)


% custom binary image
% b is an binary image
b = im2bw(f, 0.64);

figure(8); imshow(b);







