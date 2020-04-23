% Demo of double edge effect
clear all
close all

sq = zeros(256);
sq(64:192, 64:192) = 256;
figure(1); imshow(sq); 

ft = 1/25.*ones(5);

sq1 = conv2(double(sq-128),ft);
figure(2),imshow(uint8(sq1));

lp = fspecial('log', [5 5], 0.5); sq2 = conv2(sq1,lp);
figure(3),imshow(uint8(sq2+128),[]);

