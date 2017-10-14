% Loads up the SPAM Dataset from Hewlett Packard Labs.
% Builds a CART based on the features provided
% Does a 10-fold cross validation to report the average classification
% rate.

clc;
clear all;
close all;

% Load the spam dataset
spamData = load('spam.txt');

%Seprating the features and the responses
x = spamData(:,1:57);
y = spamData(:,58);

% Performing CART with 10-fold cross validation
folds = 10;
testIndex = cvpartition(length(y),'kfold',folds);

% define features Name array
names = cell(57,1);
for i=1:57
    names{i} = ['Feature ',num2str(i)];
end;

for i=1:folds
    testDataIndex = test(testIndex,i);
    trainDataIndex = ~testDataIndex;
    
    yTrain = y(trainDataIndex,:);
    xTrain = x(trainDataIndex,:);
    yTest = y(testDataIndex,:);
    xTest = x(testDataIndex,:);
    names = names';
    cartTree = classregtree(xTrain,yTrain,'method','regression','names',names);
    % useful for debugging
    % view(cartTree);
    
    yFit = eval(cartTree,xTest);
    error = abs(yFit-yTest);
    % Overall error per tree
    errorMean(i) = mean(error);    
end

overAllClassificationRate = mean(errorMean)
    
