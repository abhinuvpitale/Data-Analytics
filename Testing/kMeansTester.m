clc;
clear all;

dataSet1 = load('clusterSet1.txt');
iterK = 15;
for i = 2:iterK
    [IDX, C, SUMD, D] = kmeans(dataSet1, i);
    sumSumD(i-1) = sum(SUMD);
end

plot(2:iterK,sumSumD);
title('Elbow Plot');
xlabel('number of clusters(K)');
ylabel('distance within cluster');