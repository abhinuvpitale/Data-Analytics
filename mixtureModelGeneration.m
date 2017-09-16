%% Part A.1
clc;
clear all;

I = eye(2);
% Generate the means for red and blue data centres using (1,0) and (0,1).
% Gaussian Mixture Model
mBlue = mvnrnd([1,0]', I/5,50);
mRed = mvnrnd([0,1]', I,50);

figure(1);
hold on;
plot(mBlue(:,1),mBlue(:,2),'bx');
plot(mBlue(:,1),mRed(:,2),'rx');

%% Part A.2

% Generate datapoints for individual means m1,m2......m10 where 1-5 is blue
% and 6-10 is for blue.
dataPointBlue = null(2,1)
dataPointRed = null(2,1)
for i = 1:length(mBlue)
    mDataPoint = mBlue(i,:);
    dataPointBlue = [dataPointBlue; mvnrnd(mDataPoint,I/5,100)]
end


for i = 1:length(mRed)
    mDataPoint = mRed(i,:);
    dataPointRed = [dataPointRed; mvnrnd(mDataPoint,I/5,100)]
end


figure(2);
hold on;
plot(dataPointBlue(:,1),dataPointBlue(:,2),'bo');
plot(dataPointRed(:,1),dataPointRed(:,2),'ro');
