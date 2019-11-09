function []=plot1Ard(rd,rDates,stockname)


f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);
plot(rDates, rd, 'blue');
datetick('x','yyyy');
box off; grid on;
ylabel('Stock jump returns')
xlabel('Time');
title(strcat('Stock ',stockname, ' jump Returns'));
%print(f,'-dpng','-r200','figures/1Brd_VZ');
%close(f);