utk = imread('Fig0903(a)(utk).tif');
gt = imread('Fig0903(b)(gt).tif');
figure(1); imshow(utk);
figure(2); imshow(gt);

comp_utk = ~utk;
figure(3); imshow(comp_utk);

AorB = utk | gt;        %A union B
figure(4); imshow(AorB);

AandB = utk & gt;       %A intersection B
figure(5); imshow(AandB);

AanddifB = utk & ~gt;
figure(6); imshow(AanddifB);
