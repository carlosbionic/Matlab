%%% initialize a piecewise function describing the aperture, 
%%% then using fft2 to simulate the diffraction pattern.

clear;clc;close all

x=-30:0.1:30; %domain
num=size(x,2);
for i=1:1:num %set initial values for aperture; here is a double-slit
if x(i)<2.5 && x(i)>1.5
y(i)=1;
else
if x(i)<-1.5 && x(i)>-2.5
y(i)=1;
else
y(i)=0;
end
end
end
subplot(3,1,1);
plot(x,y);xlabel('aperture function');
subplot(3,1,2);
imagesc(y);xlabel('aperture for diffraction');

fourier=fft(y); %create diffraction pattern
fourier=fftshift(fourier);
fourier_abs=abs(fourier); %get the intensity of diffraction for display
fourier_abs=mat2gray(fourier_abs);

subplot(3,1,3);
imagesc(fourier_abs);xlabel('diffraction pattern using fft2');


