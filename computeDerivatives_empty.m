function [fx, fy, ft] = computeDerivatives(im1, im2)

    if size(im2,1)==0
        im2=zeros(size(im1));
    end

    % Horn-Schunck original method
    Sobel_x = fspecial('Sobel')';
    Sobel_y = fspecial('Sobel');
    fx = imfilter(im1, Sobel_x) + imfilter(im2, Sobel_x); 
    fy = imfilter(im1, Sobel_y) + imfilter(im2, Sobel_y); 
    ft = im1 - im2;
    asd
    asd
    asd
    kmklmlk

end