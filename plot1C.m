function []=plot1C(ac,stockname)

startDate = datenum('0935','HHMM')
endDate = datenum('1600','HHMM')
xData = linspace(startDate,endDate,77)

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(xData, ac, 'blue');
datetick('x','HH:MM');
box off; grid on;
ylabel('Stock average local variance')
xlabel('Time');
title(strcat('Stock ',stockname, ' Average Local Variance'));
%print(f,'-dpng','-r200','figures/1Brc_VZ');
%close(f);