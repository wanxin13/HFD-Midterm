function [CI_low,CI_up,bsample]=getBBeta( J,n,T,rc,a,kn)


Beta_hat = zeros(T,J); % save the estimated values for each boostrap repetition
% for each bootstrap repetition
for j = 1:J
    % obtain a bootstrap sample
    bsample = getTBSample(rc,n,a,T,kn);
    % compute theta hat
    Beta_hat(:,j) = getBeta(bsample(:,1),bsample(:,2), n, T);% whatever you need to compute, like RV or RB or Rrho
end
% compute the quantiles of theta_hat to find the confidence interval for theta
for i =1:T
        CI_low(i,1) = quantile(Beta_hat(i,:), 0.025);
        CI_up(i,1) = quantile(Beta_hat(i,:), 0.975);
end