clc;
clear all;

img = imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\Flower black and white image.jpg");

if size(img, 3) == 3 then
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

sobel_edges = edge(gray_img, 'sobel');

canny_edges = edge(gray_img, 'canny');

figure();

subplot(1,3,1);
imshow(gray_img);
title('Original Image');

subplot(1,3,2);
imshow(sobel_edges);
title('Sobel Edge Detection');

subplot(1,3,3);
imshow(canny_edges);
title('Canny Edge Detection');
