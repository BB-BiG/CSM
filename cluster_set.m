function [ class, cntrs ] = cluster_set( sample, k ,n)

% [ cidx, cntrs ] = cluster_set( sample )
%  cidx is the corroesponding clusters of the genes after clustering, and
% cntrs are the centroids of clusters, we use k-means clustering here.
%   Finds out inharent pattern in the expression levels of the genes
% k = number of clusters
[cidx, cntrs] = kmeans(sample, k,'dist','sqeuclidean',...
'rep',3,...
'disp','final','maxit',700);

for i=1:n
    G(i,1)=i;
end

for i=1:k
    A(:,i)=(cidx==i);
    B=G(A(:,i));
    
    s = size(B);
    rows = s(1);
    for j=1:rows
        class1(j,i)= B(j,1);
    end
end

[C,I] = sort(cntrs);
for i=1:k
    class(:,i)= class1(:,I(i));
end
% x=1:n;
% gscatter(x,sample,cidx);
% title('Clustering of Expression of 1st Normal Patient');
% ylabel('Expression Label');
% xlabel('Gene');
% hold on
% plot(cntrs(:,1),'kx',...
%      'MarkerSize',12,'LineWidth',2);
end