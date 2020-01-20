function [Index, Max, Total] = CSM_extended(MV)
% MV = 3d membership value matrix
% C     = total number of clusters
% G     = total number of genes
% S       = total number of samples
[G, C, S] = size(MV);
for i=1:G           
    for j=1:C
        s = zeros(9,1);
        mu = zeros(9,1);
        for k=1:S  
            if MV(i,j,k)>=0.9
                s(9) = s(9)+1;
                mu(9) = mu(9) + MV(i,j,k);
            else if MV(i,j,k)>=0.8
                    s(8) = s(8)+1;
                    mu(8) = mu(8) + MV(i,j,k);
                else if MV(i,j,k)>=0.7
                        s(7) = s(7)+1;
                        mu(7) = mu(7) + MV(i,j,k);
                    else if MV(i,j,k)>=0.6
                            s(6) = s(6)+1;
                            mu(6) = mu(6) + MV(i,j,k);
                        else if MV(i,j,k)>=0.5
                                s(5) = s(5)+1;
                                mu(5) = mu(5) + MV(i,j,k);
                            else if MV(i,j,k)>=0.4
                                    s(4) = s(4)+1;
                                    mu(4) = mu(4) + MV(i,j,k);
                                else if MV(i,j,k)>=0.3
                                        s(3) = s(3)+1;
                                        mu(3) = mu(3) + MV(i,j,k);
                                    else if MV(i,j,k)>=0.2
                                            s(2) = s(2)+1;
                                            mu(2) = mu(2) + MV(i,j,k);
                                        else if MV(i,j,k)>=0.1
                                                s(1) = s(1)+1;
                                                mu(1) = mu(1) + MV(i,j,k);
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        C1(j) = max(mu.*s);
    end
    [Max(i),Index(i)] = max(C1);
    Total(i) = sum(MV(i,Index(i),:));
end
end