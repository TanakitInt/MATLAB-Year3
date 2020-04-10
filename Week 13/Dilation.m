A = imread('Fig0906(a)(broken-text).tif');
%A = imread('Fig0922(a)(book-text).tif')
figure(1); imshow(A);

B = [0 1 0;
     1 1 1;
     0 1 0];
 
% Better B
%B = [0 0 0;
%     1 1 1;
%     0 0 0];

A2 = imdilate(A, B);
figure(2); imshow(A2)
