%% Linear dispersion model

figure;
datapoints = 2:10;
xdata=f(datapoints);
ydata=speed(datapoints);
plot(xdata,ydata,'o')  

P = polyfit(xdata,ydata,1);
yfit = P(1)*xdata+P(2);
hold on;
plot(xdata,yfit,'ys-.');
legend('Phase velocity','Linear fit')
xlabel('Frequency')
ylabel('Phase velocity')

%% Estimate the wellness of modelfit using R-squared
SS_tot= sum((ydata-mean(ydata)).^2);
SS_res=sum((ydata-yfit).^2);
Rsquared=1-(SS_res/SS_tot)