function [rd_large,t_large,i_large]=FindLargestJumps(rd,n,T,kn)

rd_large = zeros(3,1);
t_large = zeros(3,1);
i_large = zeros(3,1);
        
rdsort = sort(abs(rd),'descend');

for t = 1:T
    for i = 1:n
        for j = 1:3
            if abs(rd((t-1)*n+i,1)) == rdsort(j,1) && i>=1+kn && i<=n-kn
                rd_large(j,1) = rdsort(j,1);
                t_large(j,1) = t;
                i_large(j,1) = i;
            end
        end
    end
end
                
             