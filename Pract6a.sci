
clc;
clear all;

img = imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\butterfly 2.jpg");

if size(img, 3) == 3 then
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

gray_img = double(gray_img);

sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

Gx = imfilter(gray_img, sobel_x);
Gy = imfilter(gray_img, sobel_y);

gradient_img = sqrt(Gx.^2 + Gy.^2);

laplacian_mask = [0 1 0; 1 -4 1; 0 1 0];
laplacian_img = imfilter(gray_img, laplacian_mask);

sharpened_img = gray_img - laplacian_img;

figure();
subplot(2,2,1);
imshow(uint8(gray_img));
title('Original Image');

subplot(2,2,2);
imshow(uint8(gradient_img));
title('Gradient (Sobel)');

subplot(2,2,3);
imshow(uint8(laplacian_img));
title('Laplacian');

subplot(2,2,4);
imshow(uint8(sharpened_img));
title('Sharpened (Laplacian Enhanced)');






