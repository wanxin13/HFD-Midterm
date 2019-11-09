function [ac]=getAverageLocalVariance(rc,kn,T,n)
% getAverageLocalVariance computes the average local variance c at time t
%
% INPUTS:
%  rc: diffusive returns
%  kn: window size parameter
%  t: day t
%  i: interval i
%  n: number of returns in a day
%
% OUTPUT:
%  c: average local variance estimator
%

ac = zeros(n,1);
for i = 1:n
    for t = 1:T
        ac(i,1) = ac(i,1)+ getLocalVariance(rc,kn,t,i,n);
    end
    ac(i,1) = ac(i,1)/T;
end