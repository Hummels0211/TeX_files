clear all;    % Clean up the temporary memory.
global k_1;
k_1 = 10000;
tRange = [0, 1000];            % Setting the time range.
y0 = [100000, 10000, 1000, 30]; % The initial condition, y0(1) to y0(4) ...
                             % is the value S', z_2, b_12 and N_c.
%while y0(1) <= 2000,                             
[T,Y] = ode15s(@bz28, tRange, y0); % Solving the dynamic equations using ... 
                                  % ode45.                                                                

subplot(2,2,1);                                
plot(T,Y(:,1),'m');
title('Stress Level(S)');
set(gca,'xscale','log');
xlabel('Time(t)');
ylabel('Expression Level');
hold on

subplot(2,2,2)
plot(T,Y(:,2),'b');
title('bZIP28(z_2)');
set(gca,'xscale','log');
xlabel('Time(t)');
ylabel('Expression Level');
hold on

subplot(2,2,3)
plot(T,Y(:,3),'k');
title('BIP1/2(b_{12})');
set(gca,'xscale','log');
xlabel('Time(t)');
ylabel('Expression Level');
hold on

subplot(2,2,4)
plot(T,Y(:,4),'g');
title('NAC089c(N_c)');
set(gca,'xscale','log');
xlabel('Time(t)');
ylabel('Expression Level');
hold on

%y0(1) = y0(1) + 100;
%end 
tic;

%legend('Stress(S)','bZIP28(z_2)','BIP1/2(b_{12})','NAC089c(N_c)');
%xlabel('Time(t)');
%set(gca,'xscale','log');
%ylabel('Expression Level');

figure;

m = 10;
x1 = [];
y1 = [];
for i = 1:0.025:m
    y0(1) = 10^i;
    x1 = [x1; y0(1)];
    [T,Y] = ode15s(@bz28, tRange, y0);
    y1 = [y1; Y(end,1)];
               
end
plot(x1,y1,'--x');
set(gca,'xscale','log');
xlabel('The initial value of S');
ylabel('The steady value of S');