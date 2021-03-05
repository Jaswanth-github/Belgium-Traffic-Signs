function images_scaled = rescale(images,p,q)

m = size(images,2); % Total number of images.

for i = 1:m
    images_scaled{i} = imresize(images{i},[p q]);
end