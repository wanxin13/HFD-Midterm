function [CI_J_low, CI_J_up,c_left,c_right] = getCIofJumpBootstrap(r,rc,t,i,n,kn,k)

% compute 95% confidence interval for jump assume local variance function
% is dicontinuous

% k = bootstrap times

[c_left,c_right]=getLimitLocalVariance(rc,t,i,n,kn);

% bootstrap get zeta quantile
for j = 1:k
    zeta(1,j) = getZeta(c_left,c_right);
end
zeta_low = quantile(zeta,0.025);
zeta_high = quantile(zeta,0.975);

CI_J_low = r((t-1)*n+i,1) + zeta_low*sqrt(1/n);
CI_J_up = r((t-1)*n+i,1) + zeta_high*sqrt(1/n);

