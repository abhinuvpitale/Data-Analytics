clc;
clear all;
close all;

% generate a 2-component Gaussian Mixture Model with variances = 1
x1 = [-5:0.1:5];
%Variance = 1
sigma = 0.1;
gaussian1 = mvnpdf(x1(:) , 1, sigma);
gaussian2 = mvnpdf(x1(:) , -1, sigma);

%Show the Gaussian Mixture Model
figure(1);
subplot(2,1,1);
hold on;
plot(gaussian1);
plot(gaussian2);
title('Two Component Gaussian Mixture Model densities')
%Plot the responsiblities/probabilities
gaussianTot = gaussian1 + gaussian2;
prob1 = gaussian1./gaussianTot;
prob2 = gaussian2./gaussianTot;

%Show the Probabilities
figure(1);
subplot(2,1,2)
hold on;
plot(prob1);
plot(prob2);
title('Probability/Responsiblities of a point belonging to a cluster')