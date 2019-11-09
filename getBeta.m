function [beta] = getBeta(rc1,rc2,n,T)

% getBeta computes the realized beta estimator for two different stocks

rcov = zeros(T,1);
tv = zeros(T,1);
beta = zeros(T,1);

for t = 1:T
    for i = 1:n
        rcov(t,1) = rcov(t,1) + rc1((t-1)*n+i,1)*rc2((t-1)*n+i,1);
        tv(t,1) = tv(t,1) +  rc1((t-1)*n+i,1)*rc1((t-1)*n+i,1);
    end
end

for t = 1:T
    beta(t,1) = rcov(t,1)/tv(t,1);
end
