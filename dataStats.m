function dataStats(images,labels)

% store cell array related variables

m = size(labels,2); % Total number of images.

% Get the unique labels from the data.

uniqLabels = length(unique(cellfun(@num2str,labels,'UniformOutput',false)));

% Plot the histogram to see the distribution of images in each type.
figure;
histogram(cell2mat(labels),uniqLabels,'BinWidth',1);
xlabel('Category Label');
ylabel('Picture count in each label');


% Pick some random numbers to check the images.

idxs = randi(m,1,5); % assuming the total images >= 5

%Display the images using imshow function. imshow works only for colour
%picture with RGB pixel data.
figure;
for i = 1:length(idxs)
    subplot(1,length(idxs),i), imshow(images{idxs(i)});
end


%Display image of each category
figure;
row = 1 + round(sqrt(uniqLabels));
col = 1 + round(sqrt(uniqLabels));
for i = 1:uniqLabels
    p = max(find(cell2mat(labels) == i));
    subplot(row,col,i), imshow(images{p});
end
