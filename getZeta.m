function [zeta] = getZeta(c_left,c_right)

% c_left: left limit of local variance
% c_right: right limit of local variance

% Z_left,Z_right: random variable ~ N(0,1)
% rho: random variable ~ Unif[0,1]

%zeta: parameter used for calculate confidence interval for jumps

Z_left = normrnd(0,1);
Z_right = normrnd(0,1);

rho = rand;

zeta = sqrt(c_left*rho)*Z_left + sqrt(c_right*(1-rho))*Z_right;
