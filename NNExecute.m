
% Read the training data from the local folder on your computer.
[labels, images] = load_data('C:\Users\zz17890\Desktop\ML\BelgiumTS\Training');

% Check the data stats like total labels, image distribution, size of
% images and so on.
dataStats(images,labels);

% Scale the images to our required training feature size. Some more
% features can be added to improve the image quality.
imScaled = rescale(images,28,28);

% Once again run the stats to check the image distortion and any other
% issue with the images.
dataStats(images,labels);

% Convert the resized images to gray scale as the images are all mutually
% exclusive.
grayImg = conv2Gray(imScaled);

% Once again check the images to identify any issues.
dataStats(grayImg,labels);

% Now convert the cell arrays to feature matrices.
[gray, labelsMat] = flatten(grayImg,labels);

% Normalize the features for good convergence of gradient descent.
[grayNorm, mu, sigma] = featureNormalize(gray);

% Define the hidden and outer layer details. These values can be changed as
% per the necessity.
input_layer_size  = size(grayNorm,2);  % 28 x 28 Input Images of Digits
hidden_layer_size = 378;   % 378 hidden units
num_labels = length(unique(cellfun(@num2str,labels,'UniformOutput',false)));
% number of outer layer units is nothing but the total unique labels in the
% dataset.

% Define the initial weigth matrices to be fed into NN.
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

% train the NN model.
train;

