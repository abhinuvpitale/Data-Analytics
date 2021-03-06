clc;
clear all;
close all;

dataSet1 = load('clusterSet1.txt');

distY = pdist(dataSet1);
viewY = squareform(distY);

linkY = linkage(distY,'average');
dendrogram(linkY);

c = cophenet(linkY,distY);
disp(c);

T = cluster(linkY,'cutoff',1.153);
max(T)