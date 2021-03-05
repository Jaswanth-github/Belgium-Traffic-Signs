function [labels images] = load_data(data_directory)

    % Add the folders and subfolders to the matlab path for further
    % processing.
    addpath(genpath(data_directory));
    
    %Store the folder names into a variable for reading files later.
    directories = split(genpath(data_directory),';');
    
    %Remove the first object as it will be the input directory name.
    directories = directories(2:end);
    
    %initialize some variables. Please note that labels and images are
    %created as cell arrays so that they can all be indexed easily
    labels = {};
    images = {};
    files = [];
    
    %go to each folder and find the *.ppm files
    for d = 1:length(directories)
        
        %Inside each folder, check if there are *.ppm files and add them to
        %the files variable.
        files = dir(fullfile(directories{d},'*.ppm'));

        %if there are no files, just skip that folder else read the images.
        if ~isempty(files)
            for im = 1:length(files)
                
                %read the images and store them to the cell arrays along
                %with the index as the label of the image.
                images{end+1} = imread(files(im).name);
                labels{end+1} = d;
            end
        end
    end
    
            
            
            