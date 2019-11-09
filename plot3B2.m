function []=plot3B2(CI_upOne,CI_lowOne,BetaOne,datesOne,stockname)


f = figure;
set(f,'units','normalized','outerposition',[0 0 1 1]);

a=plot(datesOne, CI_upOne, 'black');
hold on
b=plot(datesOne, CI_lowOne, 'blue');
hold on
c=plot(datesOne, BetaOne, 'red');

c.Color(4) = 0.8;

datetick('x','yyyy-mm-dd');
box off; grid on;
ylabel('Stock Realized Beta')
xlabel('Days in Oct.2008');
title(strcat('Stock ',stockname, ' CI for Realized Beta in Oct.2008'));
legend('CI_upOne','CI_lowOne','BetaOne')
%print(f,'-dpng','-r200','figures/1F');
%close(f);