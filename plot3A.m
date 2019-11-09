function []=plot3A(beta,rDates,n,T,stockname)

for d = 0:T-1
    dates(d+1,1)= rDates(n*d+1,1)
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(dates, beta, 'blue');
datetick('x','yyyy');
box off; grid on;
ylabel('Stock Realized Beta')
xlabel('Time');
title(strcat('Stock ',stockname, ' Realized Beta'));
%close(f);