function grayImages = conv2Gray(resizedImages)

grayImages = {};

% Convert the images to gray scale

m = size(resizedImages,2); % Total number of images.

for i = 1:m
    grayImages{i} = rgb2gray(resizedImages{i});
end