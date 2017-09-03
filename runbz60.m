clear all;                   % Clean up the temporary memory.
tRange = [0, 100];            % Setting the time range.
y0 = [1000, 430, 30, 1000, 30]; % The initial condition, y0(1) to y0(4) ...
                             % is the value S', z_2, b_12 and N_c.
[T,Y] = ode15s(@bz60, tRange, y0); % Solving the dynamic equations using ... 
                                    % ode45.

subplot(3,2,1)                                   
plot(T,Y(:,1),'m');
title('Stress(S)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression Level');
hold on

subplot(3,2,2)
plot(T,Y(:,2),'b');
title('Unspliced bZIP60(b_{1u})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression Level');
hold on

subplot(3,2,3)
plot(T,Y(:,3),'k');
title('Spliced bZIP60(b_{1s})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression Level');
hold on

subplot(3,2,4)
plot(T,Y(:,4),'r');
title('BIP3(b_{3})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression Level');
hold on

subplot(3,2,5:6)
plot(T,Y(:,5),'g');
title('Complete length NAC089(N_C)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression Level');


%legend('Stress(S)','bZIP60u(z_{1u})','bZIP60s(z_{1s})','BIP3(b_{3})',...
    %'NAC089c(N_c)');
%xlabel('Time(t)');
%set(gca,'xscale','log');
%set(gca,'yscale','log');
%grid on;
%grid minor;
%ylabel('Expression Level');

figure;

m = 10;
x1 = [];
y1 = [];
for i = 1:0.025:m
    y0(1) = 10^i;
    x1 = [x1; y0(1)];
    [T,Y] = ode15s(@bz60, tRange, y0);
    y1 = [y1; Y(end,1)];
               
end
plot(x1,y1,'--x');
set(gca,'xscale','log');
xlabel('The initial value of S');
ylabel('The steady value of S');