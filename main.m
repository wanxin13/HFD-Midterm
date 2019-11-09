% main.m
% This script when run should compute all values and make all plots
% required by the midterm.
% To do so, you must fill the functions in the functions/ folder,
% and create scripts in the scripts/ folder to make the required
% plots.

% Add folders to path
addpath('./functions/','./scripts/');

% Add plot defaults
plotDefaults;

%% Exercise1
%Input Values
N = 78
T = 2769
n = N-1
alpha = 4.5

%local variance estimator
kn = 6
t = 200

% Bootstrap
k = 1000

% % Compute values
[dates,X] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\HD5min.csv',0)
[rDates, r] = getReturns(dates, X, N, T)
tau = getTimeOfDay(r,n,T)
cut = getThreshold(r, n, T, tau, alpha)
[rc,rd,count] = SeparateJumps(r,rDates, n, T, cut)

% get local variance of a day
for i = 1:n
    c(i,1) = getLocalVariance(rc,kn,t,i,n);
end
[ac]=getAverageLocalVariance(rc,kn,T,n)
% Make plots
plot1A1(dates,X,'HD');
plot1A2(r,rDates,'HD');
plot1Arc(rc,rDates,'HD');
plot1Ard(rd,rDates,'HD');
plot1B(c,t,'HD');
plot1C(ac,'HD');
%% Exercise2
%Compute values
[rd_large,t_large,i_large]=FindLargestJumps(rd,n,T,kn)
for s = 1:3
    c_large(s,1) = getLocalVariance(rc,kn,t_large(s,1),i_large(s,1),n);
end

% confidence interval for each jump
for s= 1:3
    [CI_J_lower(s,1),CI_J_upper(s,1)] = getCIofJump(r,c_large(s,1),t_large(s,1),i_large(s,1),n);
end

% confidence interval for jump magnitude
for s= 1:3
    if CI_J_upper(s,1) < 0
     CI_J_lower_mag(s,1) = -CI_J_upper(s,1);
     CI_J_upper_mag(s,1) = -CI_J_lower(s,1);
    else
     CI_J_lower_mag(s,1) = CI_J_lower(s,1);
     CI_J_upper_mag(s,1) = CI_J_upper(s,1); 
    end
end
% create table
Writetable2A(t_large,i_large,rd_large,c_large,CI_J_lower,CI_J_upper,CI_J_lower_mag,CI_J_upper_mag,'HD');

% condifence interval by bootstrap
for s = 1:3
    [CI_J_low(s,1), CI_J_up(s,1),c_left(s,1),c_right(s,1)] = getCIofJumpBootstrap(r,rc,t_large(s,1),i_large(s,1),n,kn,k);
end

for s= 1:3
    if CI_J_up(s,1) < 0
     CI_J_low_mag(s,1) = - CI_J_up(s,1);
     CI_J_up_mag(s,1) = - CI_J_low(s,1);
    else
        CI_J_low_mag(s,1) = CI_J_low(s,1);
        CI_J_up_mag(s,1) = CI_J_up(s,1);
    end
end

Writetable2B(t_large,i_large,rd_large,c_left,c_right,CI_J_low,CI_J_up,CI_J_low_mag,CI_J_up_mag,'HD');

% Make plots

%% Exercise3
% %Input Values
N = 78
T = 2769
n = N-1
alpha = 4.5

kn = 11
a = 2
J = 1000

count = 0;
count_low = 0;
count_high = 0;
% % Compute values
[dates,X1] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\SPY5min.csv',0)
[rDates, r1] = getReturns(dates, X1, N, T)
tau1 = getTimeOfDay(r1,n,T)
cut1 = getThreshold(r1, n, T, tau1, alpha)
[rc1,rd1,count1] = SeparateJumps(r1,rDates, n, T, cut1)

[dates,X2] = loadStockData('C:\Users\wc145\ECON672\Projects\Data\HD5min.csv',0)
[rDates, r2] = getReturns(dates, X2, N, T)
tau2 = getTimeOfDay(r2,n,T)
cut2 = getThreshold(r2, n, T, tau2, alpha)
[rc2,rd2,count2] = SeparateJumps(r2,rDates, n, T, cut2)

[Beta] = getBeta(rc1,rc2,n,T);

% Bootstrap CI for realized beta
rc = [rc1,rc2];
[CI_low,CI_up,bsample]=getBBeta( J,n,T,rc,a,kn);
[BetaOne,CI_lowOne,CI_upOne,datesOne] = getOneMonthBeta(Beta,CI_low,CI_up, rDates, n, T);

% Count confidence intervals include 1
for t = 1:T
    if CI_low(t,1)<=1 && CI_up(t,1)>=1
        count = count +1;
    end
end
for t = 1:T
    if CI_low(t,1)>1 
        count_high = count_high +1;
    end
end
for t = 1:T
    if  CI_up(t,1)<1
        count_low = count_low +1;
    end
end
%Make plots
plot3A(Beta,rDates,n,T,'HD');
plot3B(CI_up,CI_low,Beta,rDates,n,T,'HD');
plot3B2(CI_upOne,CI_lowOne,BetaOne,datesOne,'HD');