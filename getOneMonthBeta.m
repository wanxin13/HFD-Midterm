function [BetaOne,CI_lowOne,CI_upOne,datesOne] = getOneMonthBeta(Beta,CI_low,CI_up, rDates, n, T)
% getOneMonthTV computes the truncated variance estimator for the integrated
%       variance in one particular month
%
% INPUT:
%  rc: vector of doubles, diffusive returns
%  n: intenger, number of returns in a day
%  T: integer, number of days
%
% OUTPUT:
%  TVOne: vector of doubles, truncated variance in one month
%

% Initialize output
i=1;
for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1)
end

%Pick TVOne
for d = 0:T-1
    m = month(datetime(dates(d+1,1),'ConvertFrom','datenum'));
    y = year(datetime(dates(d+1,1),'ConvertFrom','datenum'));
    if y == 2008& m == 10
        BetaOne(i,1)=Beta(d+1,1);
        CI_lowOne(i,1)=CI_low(d+1,1);
        CI_upOne(i,1)=CI_up(d+1,1);
        datesOne(i,1)=dates(d+1,1);
        i=i+1;
    end
end
