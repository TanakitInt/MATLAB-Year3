% gray_recon_op.m
% ------------------------------------------------

close all

f = imread('Fig0925(a)(dowels).tif'); 
se = strel('disk', 5);

% Opening by reconstruction ----------------------

fe = imerode(f, se);           % Generate a marker, fe. 
fobr = imreconstruct(fe, f);   % f is a mark.

% Closing by reconstruction ----------------------

fobrc = imcomplement(fobr);
fobrce = imerode(fobrc, se);
fobrcer = imcomplement(imreconstruct(fobrce, fobrc));

figure(1), imshow(f); 
figure(2), imshow(fe); 
figure(3), imshow(fobr);
figure(4), imshow(fobrcer);

