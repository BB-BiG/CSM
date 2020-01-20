function [ IN, OUT, set, set1 ] = SetCluster(n1, n2, normal, tumor)
k=3;
[n s] = size(normal);
for c= n1:n2
    c
    set=[];
    if c == n1
        class=zeros(3,3); cntrs =[];
        [ class, cntrs ] = cluster_set( normal(:,c), k, n );
    else
        class1 =zeros(3,3); cntrs1 = [];
        [ class1, cntrs1 ] = cluster_set( normal(:,c), k, n );
        for j=1:size(class,2)
            a = intersect(class1(:,j),class(:,j));
            [r, s] = size(a);
           % set = zeros(n,k);
            for i=1:r
                set(i,j)=a(i,1);
            end
        end
        class=[];
        class =set;  
    end
end

for c= n1:n2
    c
    set1=[];
    if c == n1
        class =[]; cntrs =[];
        [ class, cntrs] = cluster_set( tumor(:,c), k, n );
    else
        class1 =[]; cntrs1 =[];
        [ class1, cntrs1] = cluster_set( tumor(:,c),k, n );
        for j=1:1:size(class,2)
            a = intersect(class1(:,j),class(:,j));
            [r, s] = size(a);
            %set1 = zeros(n,k);
            for i=1:r
                set1(i,j)=a(i,1);
            end
        end
        class=[];
        class =set1;
    end
end
%[ IN, OUT ] = incoming_outgoing( set, set1,k );
IN=0;
OUT=0;
end