%elbow method for determing the number of clusters
%[ class, cntrs ] = cluster_set( normal(:,1), 6 ,21805);
[r, c]=size(class);
for i=1:r
    for j=1:c
        if(class(i,j)>0)
            Clusters(i,j) = normal(class(i,j),1);
        end
    end
end
p = anova1(Clusters)