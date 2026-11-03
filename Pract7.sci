//Erosion:
clc;
clear all;

a=imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\ASIP pract 7\bird 3.jpg");

se = imcreatese('rect',5,5);
erosion=imerode(a,se);

subplot(1,2,1);
imshow(a);
title('Original Image');

subplot(1,2,2);
imshow(erosion);
title('Eroded Image');

//Dilation:
clc;
clear all;

a=imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\ASIP pract 7\eye.jpg");

se = imcreatese('ellipse',10,10);
dilation=imdilate(a,se);

subplot(1,2,1);
imshow(a);
title('Original Image');

subplot(1,2,2);
imshow(dilation);
title('Dilated Image');

//Opening:
clc;
clear all;

a=imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\ASIP pract 7\images.jfif");

se = imcreatese('rect',50,50);
erosion = imerode(a,se);
opening = imdilate(erosion,se);

subplot(1,2,1);
imshow(a);
title('Original Image');

subplot(1,2,2);
imshow(opening);
title('Opening Image');

//Closing:
clc;
clear all;

a=imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\B_W_Flower_Sunflower.jpeg");

se = imcreatese('ellipse',50,50);
dilation = imdilate(a,se);
closing = imerode(dilation,se);

subplot(1,2,1);
imshow(a);
title('Original Image');

subplot(1,2,2);
imshow(closing);
title('Closing Image');

//Extracting the Boundary:
clc;
clear all;

a=imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\butterfly 2.jpg");

se = imcreatese('ellipse',10,10);
erosion=imerode(a,se);

Boundary = a-erosion;

subplot(2,2,1);
imshow(a);
title('Original Image');

subplot(2,2,2);
imshow(erosion);
title('Eroded Image');

subplot(2,2,3);
imshow(Boundary);
title('Boundary of Image');

//Morphological Gradient:
clc;
clear all;

a=imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\Butterfly.jpg");

se = imcreatese('rect',30,30);
dilation = imdilate(a,se);
erosion = imerode(a,se);

gradient = dilation-erosion;

subplot(2,2,1);
imshow(a);
title('Original Image');

subplot(2,2,2);
imshow(dilation);
title('Dilated Image');

subplot(2,2,3);
imshow(erosion);
title('Eroded Image');

subplot(2,2,4);
imshow(gradient);
title('Morphological Gradient Image');

//Top-Hat Transformation
clc;
clear all;

a=imread("C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\Cat.JPG");

se = imcreatese('ellipse',10,10);
erosion = imerode(a,se);
opening = imdilate(erosion,se);

tophat = a-opening;

subplot(2,2,1);
imshow(a);
title('Original Image');

subplot(2,2,2);
imshow(opening);
title('Opening Image');

subplot(2,2,3);
imshow(tophat);
title('Top-Hat Image');

//Bottom-Hat Transformation
clc;
clear all;

a=imread("D:\MScit\Sem2\AI_IP\AIP_Prac1\images_4.jpg""C:\Users\Akshay\Desktop\Vaibhav Sawant\Academics College\ASIP\Images\Cat2.jpg");

se = imcreatese('rect',55,55);
dilation = imdilate(a,se);
closing = imdilate(dilation,se);

bottomhat = closing-a;

subplot(2,2,1);
imshow(a);
title('Original Image');

subplot(2,2,2);
imshow(closing);
title('Closing Image');

subplot(2,2,3);
imshow(bottomhat);
title('Bottom-Hat Image');
