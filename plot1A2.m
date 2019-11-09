function []=plot1A2(r,rDates,stockname)

f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);


plot(rDates, r, 'blue');
datetick('x','yyyy');
box off; grid on;
ylabel('returns')
xlabel('Time');
title(strcat('Stock ',stockname, ' returns'));
%print(f,'-dpng','-r200','figures/1B');
%close(f);