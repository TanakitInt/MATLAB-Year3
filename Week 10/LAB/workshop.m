% workshop.m

% 1.1 Adaptive Spatial Filters

F = [20 21 25 24 24;
     21 255 26 0 25;
     27 26 28 29 29;
     25 25 0 28 30;
     26 27 28 30 30];
 
f = mat2gray(F);

g = imnoise(f, 'salt & pepper', 0.20); % corrupted by salt & pepper noise.
f1 = medfilt2(g, [3 3], 'symmetric');
f2 = adpmedian(g, 5);


figure(1); 
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(g);
subplot(2, 2, 3); imshow(f1);
subplot(2, 2, 4); imshow(f2);

%------------------------------------------------------------
% 1.2-1.4 Periodic Noise (Frequency Domain) for 3 pictures
% Generating Spatial Random Noise

% 1st-----------------------------------------
clear all;
f = imread('lena.bmp');

M = 256;
N = 256;
a = 0.5;
b = 1;

R = a + sqrt(b * log(1 - rand(M, N))); 
% Rayleigh CDF

figure(10), imshow(uint8(abs(R)), []); 

C = [  5 10;
       10 5]
[r, R, S] = imnoise3(256, 256, C);

image_1_noise = (double(f) + (mat2gray(r).*255))./2;

figure(2);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(image_1_noise, []);
subplot(2, 2, 3); imshow(S, []);
subplot(2, 2, 4); imshow(r, []);

%Notch Filter
I = notchfilter(image_1_noise, 500, 20, 5)

figure(3);
subplot(1, 2, 1); imshow(f, []);
subplot(1, 2, 2); imshow(I, []);

% 2nd-------------------------------------------
clear all;
f = imread('lena.bmp');

M = 256;
N = 256;
a = 0.5;
b = 1;

R = a + sqrt(b * log(1 - rand(M, N))); 
% Rayleigh CDF

%figure(10), imshow(uint8(abs(R)), []); 

C = [  0 0 -3;
       0 -6 -3;
       0 -3 0];
[r, R, S] = imnoise3(256, 256, C);

image_2_noise = (double(f) + (mat2gray(r).*255))./2;

figure(4);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(image_2_noise, []);
subplot(2, 2, 3); imshow(S, []);
subplot(2, 2, 4); imshow(r, []);

%Notch Filter
I = notchfilter(image_2_noise, 2000, 50, 5)

figure(5);
subplot(1, 2, 1); imshow(f, []);
subplot(1, 2, 2); imshow(I, []);

% 3rd---------------------------------------------
clear all;
f = imread('lena.bmp');

M = 256;
N = 256;
a = 0.5;
b = 1;

R = a + sqrt(b * log(1 - rand(M, N))); 
% Rayleigh CDF

%figure(10), imshow(uint8(abs(R)), []); 

C = [  -2 1 -1;
       0 2 1;
       -1 2 -1]
[r, R, S] = imnoise3(256, 256, C);

image_3_noise = (double(f) + (mat2gray(r).*255))./2;

figure(6);
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(image_3_noise, []);
subplot(2, 2, 3); imshow(S, []);
subplot(2, 2, 4); imshow(r, []);

%Notch Filter
I = notchfilter(image_3_noise, 8000, 80, 4)

figure(7);
subplot(1, 2, 1); imshow(f, []);
subplot(1, 2, 2); imshow(I, []);














