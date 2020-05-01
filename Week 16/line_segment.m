f = imread('Fig1006(a)(building).tif');
g_canny_best = edge(f, 'canny', [0.04 0.10], 1.5);
figure(1); imshow(g_canny_best);

[H, theta, rho] = hough(g_canny_best, 'RhoResolution', 0.5);
figure(2);

imshow(H,[],'XData', theta, 'YData', rho, 'InitialMagnification', 'fit'); axis on, axis normal;
xlabel('\theta'), ylabel('\rho');
peak = houghpeaks(H, 15);
hold on

plot(theta(peak(:,2)), rho(peak(:,1)), 's', 'color', 'w');
lines = houghlines(g_canny_best, theta, rho, peak);
figure(3); imshow(g_canny_best), hold on

for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 4, 'Color', [0.6 0.6 0.6]);
end

