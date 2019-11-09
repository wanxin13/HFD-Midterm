function []=Writetable2A(t_large,i_large,rd_large,c_large,CI_J_lower,CI_J_upper,CI_J_lower_mag,CI_J_upper_mag,stockname)

Stockname = [stockname;stockname;stockname]
Day = t_large;
Interval = i_large;
JumpMagnitude = rd_large;
LocalVarianceEstimator = c_large;
ConfidenceIntervalforJump = [CI_J_lower,CI_J_upper]
ConfidenceIntervalforJumpMagnitude = [CI_J_lower_mag,CI_J_upper_mag]
T_2A = table( Stockname, Day, Interval, JumpMagnitude, LocalVarianceEstimator, ConfidenceIntervalforJump, ConfidenceIntervalforJumpMagnitude)
writetable(T_2A);