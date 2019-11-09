function [c]=getLocalVariance(rc,kn,t,i,n)
% getLocalVariance computes the local variance c at time t, t contains in
% interval t day i interval
%
% INPUTS:
%  rc: diffusive returns
%  kn: window size parameter
%  t: day t
%  i: interval i
%  n: number of returns in a day
%
% OUTPUT:
%  c: local variance estimator
%
c = 0;

if i-kn > 0 && i+kn <78 
    
        for j = i-kn : i+kn
         c = c + rc((t-1)*n+j,1)^2;
        end
        c = c/((2*kn+1)/n);
     
elseif i - kn <= 0
      
         count =0; 
         for j = 1 : i+kn
            c = c + rc((t-1)*n+j,1)^2;
            count = count +1;
         end
         c = c/(count/n);
         
    else
        
            count =0; 
            for j = i-kn : 77
              c = c + rc((t-1)*n+j,1)^2;
              count = count +1;
            end
             c = c/(count/n);
             
end
            
    
    
    
    




    