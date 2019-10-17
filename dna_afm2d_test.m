%% clear
clc; clear all; close all;

%% path
addpath('../local_threshold2d/lib');

%% load image
im = importdata('./im/afm_image.txt');

%% normalize
im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:)));

%% DNA segmentation
n = 12; k = 0.9;
imdna = niblack_threshold2d(im,n,k);

%% largest objects
n = 0.25;
imlabel = bwlabel(imdna);
stats = regionprops(imlabel,im,'MeanIntensity');
idx = find([stats.MeanIntensity]>n);
imdna = ismember(imlabel,idx);

%% plot
figure; imagesc(im); colormap gray;
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;

figure; imagesc(imdna); colormap gray;
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;