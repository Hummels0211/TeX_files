figure;

hold on;

plot([1, 10],[10, 10], '-b');

plot([10, 10],[10, 170], '--b');

plot([10, 10000],[170, 170], '-b');

hold off;

title('k_1 Value');
xlabel('Time(t)')
ylabel('k_1 Value (cps/h)');
set(gca,'xscale','log');