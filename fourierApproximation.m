close all
clear all

pkg load image

%% image loading
f=imread('canes.jpg');
f=rgb2gray(f);
f=double(f);

%% image display
figure,imagesc(f),colormap(gray)


%% fft2 & fftshift
[M,N]=size(f);
F=fft2(f)/sqrt(M*N);
cF=fftshift(F); % centering in the origin

%% get power spectrum
cP=abs(cF).^2;


%% fftshifted display

figure,imagesc(-floor(M/2):floor(M/2),-floor(N/2):floor(N/2),log(1+cP)), axis xy

%% plot the whole range
title('power spectrum'), xlabel('horizontal frequencies'), ylabel('vertical frequencies')

%% ideal HPF & hadamard product
T=100;
c=F.*(abs(F)>=T);

%% ifft & normalize
fM=real(ifft2(c))*sqrt(M*N);

%% final display
imagesc(fM),colormap(gray)
