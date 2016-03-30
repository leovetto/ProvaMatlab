function [error, iter, Vx, Vy] = OpticalFlow_while(clip, frame1, frame2, wSize, alpha, error_max)
% Horn-Schunck optical flow method 
% Horn, B.K.P., and Schunck, B.G., Determining Optical Flow, AI(17), No.
% 1-3, August 1981, pp. 185-203 http://dspace.mit.edu/handle/1721.1/6337
%
% Usage:
%
% -clip : vídeo del que extraer frames.
% -frame1: número de frame dentro del clip.
% -frame2: número de frame dentro del clip.
% -wSize: tamaño de la ventana de promediado.
% -alpha : influencia del término de suavizado.
% -error: máxima diferencia en valores de flujo aceptada entre iteraciones
%

%% Default parameters

if nargin<1
    video      = VideoReader('3_prension_mac.mp4');
end

video      = VideoReader(clip); 
numFrames  = video.numberOfFrames;
fps        = video.FrameRate;
width      = video.Width;
height     = video.Height;

if nargin<2
    frame1 = 20;
end
if nargin<3
    frame2 = frame1 + 4;
end
if nargin<4
    alpha=1;
end
if nargin<5
    wSize = 5;
end
if nargin<6
    error= 1;
end
 
im1 = read(video, frame1);
im2 = read(video, frame2);

%% Convert images to grayscale
if size(size(im1),2)==3
    im1=rgb2gray(im1);
end
if size(size(im2),2)==3
    im2=rgb2gray(im2);
end

im1=double(im1);
im2=double(im2);

tic;

%%
% Set initial value for the flow vectors
Vx = ;
Vy = ;

% Estimate spatiotemporal derivatives
[fx, fy, ft] = computeDerivatives(im1, im2);

% Averaging kernel
kernel_1 = kernel(...);

% Loop

%Inicialice el valor del error y del número de iteraciones
iter = 0;
error = [];
while 
    % Compute local averages of the flow vectors
    VxAvg = ;
    VyAvg = ;
    Vx_old =  ;
    Vy_old =  ;
    % Compute flow vectors constrained by its local average and the optical flow constraints
    Vx =  ; 
    Vy =  ;
    error =  ;
    iter =  ;
end

Vx(isnan(Vx))=0;
Vy(isnan(Vy))=0;

%% Plotting
plotFlow(Vx, Vy, im1, 3, 5)
end