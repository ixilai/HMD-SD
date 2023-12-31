clc
clear all
close all
addpath function;
chosen=1;
for ii=1:chosen
    img1 = imread(['source\Lytro dataset\',num2str(2*ii-1),'.jpg']);
    img2 = imread(['source\Lytro dataset\',num2str(2*ii),'.jpg']);
    k1 = rgb2gray(img1); k2 = rgb2gray(img2);
    k1=im2double(k1);  k2=im2double(k2);
    finalmap1 = main_map(k1,k2);
    
    img1 = im2double(img1);img2 = im2double(img2);
    if size(img1,3) == 1
    F = finalmap1.*img1 + (1-finalmap1).*img2;
    else
    F(:,:,1) = finalmap1.*img1(:,:,1) + (1-finalmap1).*img2(:,:,1);
    F(:,:,2) = finalmap1.*img1(:,:,2) + (1-finalmap1).*img2(:,:,2);
    F(:,:,3) = finalmap1.*img1(:,:,3) + (1-finalmap1).*img2(:,:,3);
    end

    figure,imshow(F);
end