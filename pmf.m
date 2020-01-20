for i=1:21805
    for j=1:12
        count(i,j)=0;
    end
end
i=1;
for i=1:21805
    for k=1:36
        if tumor(i,k) <=4
            count(i,1) =count(i,1)+1;
        else if tumor(i,k)>4 && tumor(i,k) <=5
                count(i,2) =count(i,2)+1;
            end
            if tumor(i,k)>5 && tumor(i,k) <=6
                count(i,3) =count(i,3)+1;
            end
            if tumor(i,k) >6 && tumor(i,k) <=7
                count(i,4) =count(i,4)+1;
            end
            if tumor(i,k) >7 && tumor(i,k) <=8
                count(i,5) =count(i,5)+1;
            end
            if tumor(i,k) >8 && tumor(i,k) <=9
                count(i,6) =count(i,6)+1;
            end
            if tumor(i,k)>9 && tumor(i,k) <=10
                count(i,7) =count(i,7)+1;
            end
            if tumor(i,k)>10 && tumor(i,k) <=11
                count(i,8) =count(i,8)+1;
            end
            if tumor(i,k) >11 && tumor(i,k) <=12
                count(i,9) =count(i,9)+1;
            else if tumor(i,k)>12 && tumor(i,k) <=13
                    count(i,10) =count(i,10)+1;
                else if tumor(i,k) >13 && tumor(i,k) <=14
                        count(i,11) =count(i,11)+1;
                    else if tumor(i,k) >14
                            count(i,12) =count(i,12)+1;
                        end
                    end
                end
            end
        end
    end
end
