// Image Averaging

clc;
clear all;
close all;

// Read the original image
a = imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\Butterfly.jpg");

figure();

subplot(2,2,1);
imshow(a);
title('Original Image');

// Add salt and pepper noise
D = 0.01;
g = imnoise(a, 'salt & pepper', D);

subplot(2,2,2);
imshow(g);
title('Noisy Image');

// Apply average filter
meanFilter = fspecial('average');
toShow = imfilter(g, meanFilter);

subplot(2,2,3);
imshow(toShow);
title('Average Image');


// Image Smoothening

clc;
clear all;
close all;

// Read the original image
a = imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\Cat.JPG");

// Create a 3x3 averaging mask
mask = ones(3,3) / 9;

// Apply smoothing filter
g = imfilter(a, mask);

figure();

subplot(1,2,1);
imshow(a);
title('Original Image');

subplot(1,2,2);
imshow(g);
title('Smooth Image');


// Image Enhancement using Median Function

clc;
clear all;
close all;

// Read the original image
a = imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\B_W_Flower_Sunflower.jpeg");

// Add salt and pepper noise
NoisyImage = imnoise(a, 'salt & pepper', 0.02);

// Apply median filter
output = immedian(NoisyImage, [3,3]);

figure();

subplot(2,2,1);
imshow(a);
title('Original Image');

subplot(2,2,2);
imshow(NoisyImage);
title('Noisy Image');

subplot(2,2,3);
imshow(output);
title('Output Image');
