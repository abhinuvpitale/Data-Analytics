n = 7;
[IDX, C, SUMD, D] = kmeans(dataSet1, n);
    
for i=1:n
    temp = dataSet1(find(IDX==i),:);
    scatter3(temp(:,1),temp(:,2),temp(:,3),'MarkerEdgeColor',rand(1,3))
    hold on;
end;