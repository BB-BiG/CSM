function [ fc ] = fold_change( gene, normal, cancer, p1, p2 )

% p1 = cell from
% p2 = cell to

fc=0;
n= p2-p1 + 1;
for i=p1:p2
    if cancer(gene,i) <0 || normal(gene,i)<0
        f = (-log(abs(cancer(gene,i))/abs(normal(gene,i))))/log(2);
    else
        f = (log(cancer(gene,i)/normal(gene,i)))/log(2);
    end
    fc = fc + f;
end
fc= fc/n;
end

