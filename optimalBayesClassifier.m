%% Part A.1
clc;
clear all;
close all;

I = eye(2);
% Generate the means for red and blue data centres using (1,0) and (0,1).
% Gaussian Mixture Model
mBlue = mvnrnd([1,0]', I, 5);
mRed = mvnrnd([0,1]', I, 5);


%% Part A.2

% Generate datapoints for individual means m1,m2......m10 where 1-5 is blue
% and 6-10 is for blue.
dataPointBlue = null(2,1)
dataPointRed = null(2,1)
for i = 1:length(mBlue)
    mDataPoint = mBlue(i,:);
    dataPointBlue = [dataPointBlue; mvnrnd(mDataPoint,(I/5),10)]
end


for i = 1:length(mRed)
    mDataPoint = mRed(i,:);
    dataPointRed = [dataPointRed; mvnrnd(mDataPoint,(I/5),10)]
end


%% Part A.3


X1 = -4:0.01:4;
X2 = -4:0.01:4;
[X(:,:,1),X(:,:,2)] = meshgrid(X1,X2);

Pg1 = 0;
Pg2 = 0;
for i = 1:size(mRed)
   temp1 = (X(:,:,1) - mRed(i,1)).^2 ;
   temp2 = (X(:,:,2) - mRed(i,2)).^2 ;
   temp = exp((temp1+temp2)/(-2));
   Pg1 = Pg1 + temp;
   
   
   temp1 = (X(:,:,1) - mBlue(i,1)).^2 ;
   temp2 = (X(:,:,2) - mBlue(i,2)).^2 ;
   temp = exp((temp1+temp2)/(-2));
   Pg2 = Pg2 + temp;
end


P = zeros(size(Pg1));
P(find(Pg1>Pg2)) = 1;
figure(1);
colormap 'summer' 
imagesc(X1,X2,P)

hold on;
plot(mBlue(:,1),mBlue(:,2),'bx');
plot(mBlue(:,1),mRed(:,2),'rx');
xlabel('Feature - X1');
ylabel('Feature - X2');
title('Bayesian Optimal Classifier')
legend('Green  - Group1 Means','Yellow - Group2 Means');

%% Part A.4 Plot Points
plot(dataPointBlue(:,1),dataPointBlue(:,2),'bo');
plot(dataPointRed(:,1),dataPointRed(:,2),'ro');

Pg1 = 0;
Pg2 = 0;
for i = 1:size(mRed)
   temp1 = (dataPointRed(:,1) - mRed(i,1)).^2 ;
   temp2 = (dataPointRed(:,2) - mRed(i,2)).^2 ;
   temp = exp((temp1+temp2)/(-2));
   Pg1 = Pg1 + temp;
   
   
   temp1 = (dataPointRed(:,1) - mBlue(i,1)).^2 ;
   temp2 = (dataPointRed(:,2) - mBlue(i,2)).^2 ;
   temp = exp((temp1+temp2)/(-2));
   Pg2 = Pg2 + temp;
end

Yred = zeros(size(Pg1));
Yred(find(Pg1>Pg2)) = 1;

Pg1 = 0;
Pg2 = 0;
for i = 1:size(mBlue)
   temp1 = (dataPointBlue(:,1) - mRed(i,1)).^2 ;
   temp2 = (dataPointBlue(:,2) - mRed(i,2)).^2 ;
   temp = exp((temp1+temp2)/(-2));
   Pg1 = Pg1 + temp;
   
   
   temp1 = (dataPointBlue(:,1) - mBlue(i,1)).^2 ;
   temp2 = (dataPointBlue(:,2) - mBlue(i,2)).^2 ;
   temp = exp((temp1+temp2)/(-2));
   Pg2 = Pg2 + temp;
end


Yblue = zeros(size(Pg1));
Yblue(find(Pg1<Pg2)) = 1;

%% Part A.5 Count results

True_Positives = size(find(Yred == 1));
disp('True Positives');
True_Positives(1)
True_Negatives = size(find(Yblue == 1));
disp('True Negatives');
True_Negatives(1)
False_Positives = size(find(Yblue == 0));
disp('False Positives');
False_Positives(1)
False_Negatives = size(find(Yred == 0));
disp('False Negatives');
False_Negatives(1)
