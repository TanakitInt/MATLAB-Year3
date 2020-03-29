% Example of zero padding

up = ones(128, 256);
low = zeros(128, 256);
bw = [up; low];
figure(1); imshow(bw);

[M, N] = size(bw);
BW = fft2(bw);
sig = 10;
H = lpfilter('gaussian', M, N, sig);
G = H.*BW;
g = real(ifft2(G));
figure(2); imshow(g, []);

PQ = paddedsize(size(bw));
BW1 = fft2(bw, PQ(1), PQ(2));
sig = 10;
H1 = lpfilter('gaussian', PQ(1), PQ(2), 2*sig);
% 2*sig because of the filter size is now twice the size of the filter used
% without padding.

G1 = H1.*BW1;
g1 = real(ifft2(G1));
figure(3); imshow(g1, []);

gc1 = g1(1:size(bw, 1), 1:size(bw, 2));
figure(4); imshow(gc1, []);

function g = dftfilt(f, H)
F = fft2(f, size(H,1), size(H,2));
G = H.*F;
% figure, imshow(H, []); % for debugging
% figure, imshow(uint8(abs(log(1 + F))), []); % for debugging
g = real(ifft2(G));
g = g(1:size(f,1), 1:size(f,2));
end

function [U, V] = dftuv(M, N)
% Set up range of variables.
u = 0:(M-1);
v = 0:(N-1);
% Compute the indices for use in meshgrid.
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;
% Compute the meshgrid arrays.
[U, V] = meshgrid(v, u);
end

function [H, D] = lpfilter(type, M, N, D0, n)
%
% Use function dftuv to set up the meshgrid arrays needed for
% computing the required distances.
[U, V] = dftuv(M, N);
% Compute the distances D(U, V).
D = sqrt(U.^2 + V.^2);
% Begin filter computations.
switch type
    case 'ideal'
        H = double(D <= D0);
    case 'btw'
        if nargin == 4
            n = 1;
        end
        H = 1./(1 + (D./D0).^(2*n));
    case 'gaussian'
        H = exp(-(D.^2)./(2*(D0^2)));
    otherwise
        error('Unknown filter type');
    end
end