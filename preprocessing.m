clc,clear all;
img = 'C:\Users\HP\hackathon\syntheticCellImage.tif';
info = imfinfo(img);
num_images = numel(info); %The number of images are counted for iteration purposes
k = 1;
for i = 1:num_images %This loop is executed to extract all the images and preprocess them
    t = imread(img, i);
    q = imadjust(t,[0.0 0.005],[]); 
    a = imbinarize(q);
    [centers, radii] = imfindcircles(a,[1 100],'ObjectPolarity','bright'); %The blobs are found in the binaized image
    l = length(radii);

    for j = 1:l  %this loop is executed to find the centre of all the blob circles in every image and store it into a matrix 'all'
        len(i) = l;
        all(k,1)=centers(j,1);
        all(k,2)=centers(j,2);
        all(k,3)=i;
        all(k,4)=radii(j);
        k=k+1;
    end
     
end
