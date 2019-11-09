function [CI_J_lower,CI_J_upper] = getCIofJump(r,c,t,i,n)

CI_J_lower = r((t-1)*n+i,1) - 1.96*sqrt(c/n);

CI_J_upper = r((t-1)*n+i,1) + 1.96*sqrt(c/n);


