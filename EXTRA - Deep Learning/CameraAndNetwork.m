clear all;
close all;

camera = webcam;    % Connect to the camera
nnet = alexnet;     % Load the neural net

while True
    picture = camera.snapshot;              % Take a picture
    picture = imresize(picture, [227, 227]) % Resize the picture
    
    label = classifiy(nnet, picture);       % Classify the picture
    
    image(picture);     % Show the picture
    title(char(label)); % Show the label
    drawnow;
    
end

