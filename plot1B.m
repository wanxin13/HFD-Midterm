function []=plot1B(c,t,stockname)

startDate = datenum('0935','HHMM')
endDate = datenum('1600','HHMM')
xData = linspace(startDate,endDate,77)

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(xData, c, 'blue');
datetick('x','HH:MM');
box off; grid on;
ylabel('Stock local variance')
xlabel('Time');
title(strcat('Stock ',stockname, ' Local Variance in a day'));
%print(f,'-dpng','-r200','figures/1Brc_VZ');
%close(f);