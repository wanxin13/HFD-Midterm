function []=plot1A1(dates,X,stockname)

p=exp(X);

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(dates, p, 'black');
datetick('x','yyyy');
box off; grid on;
ylabel('Stock price in dollars')
xlabel('Time');
title(strcat('Stock ',stockname, ' Prices'));
%print(f,'-dpng','-r200','figures/1B');
%close(f);


