function [ k_k1 ] = cluster_shift( MV_normal, MV_tumor, common_genes, theta1,theta2)
%This function checks for the shift in the cluster number for the common
%genes in normal and tumor samples.
num_cluster = size(MV_normal,2);
s = size(MV_normal,3);
for i=1:length(common_genes)
    for c=1:num_cluster
        l=0;
        for j=1:s
            if MV_normal(common_genes(i,1),c,j)>=theta1
                l=l+1;
            end
        end
        if l>=theta2
            k_k1(i,1)=c;
        end
    end
    % for tumor samples
    for c=1:num_cluster
        l=0;
        for j=1:s
            if MV_tumor(common_genes(i,1),c,j)>=theta1
                l=l+1;
            end
        end
        if l>=theta2
            k_k1(i,2)=c;
        end
    end
end
end

