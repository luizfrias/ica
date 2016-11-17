
%=======================================%
% Autor: Joao Victor Da Fonseca Pinto   %
% Materia: ICA                          %
% COPPE/UFRJ - Mestrado - 2016/1        %
% Professor: Jose Manoel de Seixas      %
% Objetivo: Criar um dataset de images  %
%=======================================%

clear all
close all

S0 = imread('origin_0.jpg');
S1 = imread('origin_1.jpg');
S2 = imread('origin_2.jpg');
S0 = imresize(S0, [600,800], 'nearest');
S1 = imresize(S1, [600,800], 'nearest');
S2 = imresize(S2, [600,800], 'nearest');

figure
imshow(S0);
figure
imshow(S1);
figure
imshow(S2);

imwrite(S0,'source_0.jpg','jpg');
imwrite(S1,'source_1.jpg','jpg');
imwrite(S2,'source_2.jpg','jpg');

S0=im2double(S0);
S1=im2double(S1);
S2=im2double(S2);



%==========================================================================
%Ruido gaussiano
WN = randn(size(S0));

%S0=S0+WN;
%S1=S1+WN;
%S2=S2+WN;

%Create mix matrix
A_R = rand(3,3);
A_G = rand(3,3);
A_B = rand(3,3);

%Reshape to vec distribution
s0_R = image2vec(S0(:,:,1),[6,8]);
s0_G = image2vec(S0(:,:,2),[6,8]);
s0_B = image2vec(S0(:,:,3),[6,8]);
s1_R = image2vec(S1(:,:,1),[6,8]);
s1_G = image2vec(S1(:,:,2),[6,8]);
s1_B = image2vec(S1(:,:,3),[6,8]);
s2_R = image2vec(S2(:,:,1),[6,8]);
s2_G = image2vec(S2(:,:,2),[6,8]);
s2_B = image2vec(S2(:,:,3),[6,8]);

%Red mix
s = [s0_R;s1_R;s2_R];
x_R = A_R*s;

%Green mix
s = [s0_G;s1_G;s2_G];
x_G = A_G*s;

%Blue mix
s = [s0_B;s1_B;s2_B];
x_B = A_B*s;



%==========================================================================
%check the mix picture

X0_R = vec2image(x_R(1,:),[6,8],[600,800]);
X1_R = vec2image(x_R(2,:),[6,8],[600,800]);
X2_R = vec2image(x_R(3,:),[6,8],[600,800]);
X0_G = vec2image(x_G(1,:),[6,8],[600,800]);
X1_G = vec2image(x_G(2,:),[6,8],[600,800]);
X2_G = vec2image(x_G(3,:),[6,8],[600,800]);
X0_B = vec2image(x_B(1,:),[6,8],[600,800]);
X1_B = vec2image(x_B(2,:),[6,8],[600,800]);
X2_B = vec2image(x_B(3,:),[6,8],[600,800]);

X0 = cat(3,X0_R,X0_G,X0_B);
X1 = cat(3,X1_R,X1_G,X1_B);
X2 = cat(3,X2_R,X2_G,X2_B);

X0(:,:,1) = mapminmax(X0(:,:,1),0,1);
X0(:,:,2) = mapminmax(X0(:,:,2),0,1);
X0(:,:,3) = mapminmax(X0(:,:,3),0,1);
X1(:,:,1) = mapminmax(X1(:,:,1),0,1);
X1(:,:,2) = mapminmax(X1(:,:,2),0,1);
X1(:,:,3) = mapminmax(X1(:,:,3),0,1);
X2(:,:,1) = mapminmax(X2(:,:,1),0,1);
X2(:,:,2) = mapminmax(X2(:,:,2),0,1);
X2(:,:,3) = mapminmax(X2(:,:,3),0,1);

%X0=im2int8(X0);
%X1=im2int8(X1);
%X2=im2int8(X2);

%Show the mixes
figure
imshow(X0);
figure
imshow(X1);
figure
imshow(X2);

imwrite(X0,'X_0.jpg','jpg');
imwrite(X1,'X_1.jpg','jpg');
imwrite(X2,'X_2.jpg','jpg');

%save('secret_workspace.mat')

