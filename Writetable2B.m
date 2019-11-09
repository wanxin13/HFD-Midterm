function []=Writetable2B(t_large,i_large,rd_large,c_left,c_right,CI_J_low,CI_J_up,CI_J_low_mag,CI_J_up_mag,stockname)

Stockname = [stockname;stockname;stockname]
Day = t_large;
Interval = i_large;
JumpMagnitude = rd_large;
LocalVarianceEstimator_Left = c_left;
LocalVarianceEstimator_Right = c_right;
ConfidenceIntervalforJump = [CI_J_low,CI_J_up]
ConfidenceIntervalforJumpMagnitude = [CI_J_low_mag,CI_J_up_mag]
T_2B = table( Stockname, Day, Interval, JumpMagnitude, LocalVarianceEstimator_Left, LocalVarianceEstimator_Right, ConfidenceIntervalforJump, ConfidenceIntervalforJumpMagnitude)
writetable(T_2B);