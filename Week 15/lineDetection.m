f = imread('Fig1004(a)(wirebond_mask).tif');

figure(1); imshow(f);

% -45 degree line ----------------
w = [2 -1 -1; -1 2 -1; -1 -1 2];
g = abs(imfilter(double(f), w));

figure(2); imshow(g, []);

%----------------
gtop = g(1:120, 1:120);
gtop = pixeldup(gtop, 4);

figure(3); imshow(gtop, []);

%----------------
gbot = g(end-119:end, end-119:end);
gbot = pixeldup(gbot, 4);

figure(4); imshow(gbot, []);

%----------------
g = abs(g);

figure(5); imshow(g, []);

%----------------
T = max(g(:));
g = (g >= T);

figure(6); imshow(g);

