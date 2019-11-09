function []=plot3B(CI_up,CI_low,Beta,rDates,n,T,stockname)

for d = 0:T-1
    dates( d+1,1)= rDates(n*d+1,1)
end

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot(dates, CI_up, 'black');
hold on
b=plot(dates, CI_low, 'blue');
hold on
c=plot(dates, Beta, 'red');

c.Color(4) = 0.8;

datetick('x','yyyy');
box off; grid on;
ylabel('Stock Realized Betas')
xlabel('Time');
title(strcat('Stock ',stockname, ' 95% CI for Realized Beta'));
legend('CI_up','CI_low','Beta')
%print(f,'-dpng','-r200','figures/1F');
%close(f);