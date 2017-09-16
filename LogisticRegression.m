%% Part A.1
clc;
clear all;

I = eye(2);
% Generate the means for red and blue data centres using (1,0) and (0,1).
% Gaussian Mixture Model
mBlue = mvnrnd([1,0]', I, 5);
mRed = mvnrnd([0,1]', I, 5);

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

%% Part A.3

% Creating Linear Classsifier using inv(Xt*X)*Xt*Y

X = [dataPointBlue;dataPointRed];

%Blue = 1, Red = 0
Y = [ones(500,1);zeros(500,1)];

betaCap = ((inv(X'*X))*X')*Y

%B(0)*x + B(1)*y = 1/2 -> Decision Boundary
%Choosing Random points on this line.
x1 = -3
y1 = ((1/2) - (betaCap(1)*x1))/betaCap(2)

x2 = 3
y2 = ((1/2) - (betaCap(1)*x2))/betaCap(2)

figure(2)
line([x1,x2],[y1,y2],'Color','g')

