function [x] = Workshop(f)

m = mean2(f) %Calculate a mean value in all array

if m > 0 & m < 50
    x = (2*f/3)-(4/3);
elseif m >= 50 & m < 100
    x = 2*f;
elseif m >= 100
    x = (2*f/3)+(4/3);
end

subplot(1,2,1); imshow(f);
subplot(1,2,2); imshow(x);
