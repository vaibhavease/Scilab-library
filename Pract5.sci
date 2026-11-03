clc;
clear all;
img = imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\Cat2.jpg");
if size(img, 3) == 3 then
    gray_img = rgb2gray(img);
else
    gray_img = img;
end
noisy_img = imnoise(gray_img, 'salt & pepper', 0.05);

mean_kernel = ones(3,3) / 9;
mean_smoothed = imfilter(noisy_img, mean_kernel);

gauss_kernel = fspecial('gaussian', [5 5], 1);
gauss_smoothed = imfilter(noisy_img, gauss_kernel);

[m, n] = size(noisy_img);
median_smoothed = noisy_img;

for i = 2:m-1
    for j = 2:n-1
        median_smoothed(i,j) = median([noisy_img(i-1,j-1), noisy_img(i-1,j), noisy_img(i-1,j+1), ...
                                        noisy_img(i,j-1),   noisy_img(i,j),   noisy_img(i,j+1), ...
                                        noisy_img(i+1,j-1), noisy_img(i+1,j), noisy_img(i+1,j+1)]);
    end
end

figure();
subplot(2,3,1); 
imshow(gray_img);       
title('Original Image');

subplot(2,3,2); 
imshow(noisy_img);      
title('Noisy Image');

subplot(2,3,3); 
imshow(mean_smoothed);  
title('Linear: Mean Filter');

subplot(2,3,4); 
imshow(gauss_smoothed); 
title('Linear: Gaussian Filter');

subplot(2,3,5); 
imshow(median_smoothed);
title('Non-Linear: Median Filter');

