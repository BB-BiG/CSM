function [M, b]=CSMF_V2(k,Sample,theta1)

% M = Matrix containing the membership values
% b = list of selected genes with the respective average membership values

Genes=size(Sample,1);
s=size(Sample,2);
options(1)=2.0;
options(2)=20;      % minimum number of iterattions
[cntrs,U,obj_fcn] = fcm(Sample(:,1),k,options);
[C, I] = sort(cntrs);
for i=1:k
    U2(i,:) = U(I(i),:);
end
U2=U2';
for j=1:Genes
    for c=1:k
        M(j,c,1)=U2(j,c);              % M is the 3-d Matrix of Fuzzy Clustered data
    end
end

for i=2:s
    U1=[]; U2=[];
    [cntrs,U1,obj_fcn] = fcm(Sample(:,i),k,options);
    [C, I] = sort(cntrs);
    for c=1:k
        U2(c,:) = U1(I(c),:);
    end
    U2=U2';
    for j=1:Genes
        for c=1:k
            M(j,c,i)=U2(j,c);
        end
    end
end

b=[];
M_sum = zeros(1,8);
total = 1;
for i=1:Genes
    for c=1:k
        M_sum(1,c)=0;
        for j=1:s
            M_sum(1,c)= M_sum(1,c)+M(i,c,j);
        end
    end
    l = max(M_sum)/s;
    if l> theta1
        b(total,1) = i;
        b(total,2) = l;
        total = total+1;
    end
end
end