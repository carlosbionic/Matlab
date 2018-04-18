close all; clear all;

img   = imread('plano.jpg');
subplot(1,2,1);
imagesc(img)
title('Abertura');
pbaspect([1 1 1])
img   = fftshift(img(:,:,2));
F     = fft2(img);

%figure;
subplot(1,2,2);
imagesc(100*log(2000+abs(fftshift(F)))); colormap(gray); 
title('Patrón de difracción (Fraunhofer)');
pbaspect([1 1 1])