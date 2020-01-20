function OUT1  = change_in_exp(normal, tumor, n, OUT)
% n => the number of samples
%distance = dist_metrices(normal(:,1:n), tumor(:,1:n));
s= size(normal);
s1=s(1);
for i= 1:s1
    distance(i,1) = fold_change( i, normal, tumor, 1, n);
    %distance(i,2) = mean(normal(i,1:n));
    %distance(i,3) = (distance(i,1)/distance(i,2))*100;
end

[r s]= size(OUT);

for i= 1:r
    for j= 1:s
        if OUT(i,j) ~= 0
            OUT1(i,j)=distance(OUT(i,j),1);
        else
            OUT1(i,j)=0;
        end
    end
end
j=1;
for i=1:s
    OUT2(:,j) = OUT(:,i);
    j=j+1;
    OUT2(:,j) = OUT1(:,i);
    j=j+1;
end
end