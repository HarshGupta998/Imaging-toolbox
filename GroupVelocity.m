%% Group velocity visualization and estimation

zd = 650;       % depth of interest

% For simplicity, let's check any 4 signals with 3 time units intervals
figure(5);
plot(VelocityField(zd,:,3),'o-r'); hold on;
plot(VelocityField(zd,:,6),'o-b'); hold on;
plot(VelocityField(zd,:,9),'o-k'); hold on;
plot(VelocityField(zd,:,12),'o-g'); 
xlabel('x locations #')
ylabel('amplitude')
title('plot for group velocity estimation')

clear peaks

for i=1:4
signal = VelocityField(zd,:,3*i);
peaks(i) = find(signal==max(signal));
end
distances=mean(diff(peaks));     % count distances between the peaks
pitch = param.x(2)-param.x(1);  % distance between two transducer points in m

% GroupVelocity = distance between peaks in m / time interval in seconds
GroupVelocity = distances*pitch/(3/param.PRF) 