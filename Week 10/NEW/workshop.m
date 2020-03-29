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


figure(10); 
subplot(2, 2, 1); imshow(f);
subplot(2, 2, 2); imshow(g);
subplot(2, 2, 3); imshow(f1);
subplot(2, 2, 4); imshow(f2);

%---------------------------------------
% 1


%f = imread('building.tif');
f = imread('lena.bmp');

%f = f(1:512, 1:512);
figure(1), imshow(f);
sz = size(f);

C = [6 32]; % Assign locations of noise spectrum
[r, R, S] = imnoise3(sz(1), sz(2), C);   
figure(2); imshow(r, []);    % Show Periodic noise in spatial domain
figure(3); imshow(S, []);    % Show locations of noise spectrum

fn = (double(f) + (mat2gray(r).*255))./2; % Add noise into an image
figure(4), imshow(fn, []);

PQ = paddedsize(size(fn));
FN = fft2(fn, PQ(1), PQ(2));

FNs = fftshift(FN);
FNlog = log(1 + FNs);
figure(5), imshow(uint8(abs(FNlog)), []);

[H D] = notchfilt('notch', sz(1), sz(2), 5, 8);
H1 = fftshift(H);
figure(6), imshow(uint8(H1.*255), []);

g = dftfilt(fn, H);
figure(7), imshow(uint8(g), []);

