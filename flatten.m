function [grayImgMatrix labelsMatrix]= flatten(grayImages,labels)

% define the m training examples and n features for defining an mxn matrix
% to feed into NN.

m = size(grayImages,2);
n = size(grayImages{1},1)*size(grayImages{1},2);

% Initialize the mxn training matrix and mx1 classification values matrix 
% for the training matrix.
grayImgMatrix = zeros(m,n);
labelsMatrix = zeros(m,1);

% Reshape the cell array into an mxn matrix.
for i = 1:m
    grayImgMatrix(i,:) = reshape(grayImages{i},1,[]);
    labelsMatrix(i,1) = labels{i};
end
