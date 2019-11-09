function [c_left,c_right]=getLimitLocalVariance(rc,t,i,n,kn)

c_left = 0;
c_right = 0;

for j = i-kn:i-1
    c_left = c_left + (rc((t-1)*n+j,1))^2;
end
c_left = c_left/(kn/n);

for j = i+1:i+kn
    c_right = c_right + (rc((t-1)*n+j,1))^2;
end
c_right = c_right/(kn/n);