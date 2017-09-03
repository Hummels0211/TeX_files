clear all;

global k_1;

k_1 = 10;
k1_1 = k_1;
tRange = 0:1:100000; 
y0 = [10, 450, 30, 1000, 1000, 1000, 30];

[T,Y] = ode45(@n089, tRange, y0);

figure;

subplot(4,2,1)
plot(T,Y(:,1),'m');
title('Stress Level');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,2)
plot(T,Y(:,2),'b');
title('bZIP60u(z_{1u})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,3)
plot(T,Y(:,3),'k');
title('bZIP60s(z_{1s})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,4)
plot(T,Y(:,4),'r');
title('bZIP28(z_2)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,5)
plot(T,Y(:,5),'g');
title('BIP12(b_{12})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,6)
plot(T,Y(:,6),'y');
title('BIP3(b_{3})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,7)
plot(T,Y(:,7),'c');
title('NAC089c(N_C)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;

pause;
%legend('Stress(S)','bZIP60u(z_{1u})','bZIP60s(z_{1s})',...
%    'bZIP28(z_2)','BIP12(b_{12})','BIP3(b_{3})',...
%    'NAC089c(N_C)');
%xlabel('Time(t)');
%set(gca,'xscale','log');
%grid on;
%grid minor;
%ylabel('Expression level');


figure;
y0 = Y(end,:);
yy = Y(end,:);
% function k_1 = kval(tRange(end))
%     for i = 1:1:length(tRange)
%         if (tRange(i) >  (tRange(end)*0.001)) && (tRange(i) < (tRange(end)*0.1))
%             k_1 = 6000;
%         else
%             k_1 = 0;
%         end
%     end
% end
%k_1 = kval(tRange);
t_start = 10;
t_end = 50;
tRange0 = [0:1:t_start];
tRange1 = [t_start:1:t_end];
tRange2 = [t_end:1:10000];
[T0,Y0] = ode45(@n089,tRange0,y0);
k_1 = 20;
k1_2 = k_1;
y0 = Y0(end,:);
[T1,Y1] = ode45(@n089,tRange1,y0);
y0 = Y1(end,:);
k_1 = 10;
k1_3 = k_1;
[T2,Y2] = ode45(@n089,tRange2,y0);
T = [T0;T1;T2];
Y = [Y0;Y1;Y2];

subplot(4,2,2)
plot(T,Y(:,1));
title('Stress Level');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,3)
plot(T,Y(:,2));
title('bZIP60u(z_{1u})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,4)
plot(T,Y(:,3));
title('bZIP60s(z_{1s})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,5)
plot(T,Y(:,4));
title('bZIP28(z_2)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,6)
plot(T,Y(:,5));
title('BIP12(b_{12})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,7)
plot(T,Y(:,6));
title('BIP3(b_{3})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,8)
plot(T,Y(:,7));
title('NAC089c(N_C)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;


hold on;

subplot(4,2,1)
plot([1, t_start],[k1_1, k1_1], '-', 'color', [0, 0.4470, 0.7410]);
hold on;
plot([t_start, t_start],[k1_1, k1_2], '--', 'color', [0, 0.4470, 0.7410]);
hold on;
plot([t_start, t_end],[k1_2, k1_2], '-', 'color', [0, 0.4470, 0.7410]);
hold on;
plot([t_end, t_end],[k1_2, k1_3], '--', 'color', [0, 0.4470, 0.7410]);
hold on;
plot([t_end, 10000],[k1_3, k1_3], '-', 'color', [0, 0.4470, 0.7410]);
hold on;
title('k_1 Value');
xlabel('Time(t)')
ylabel('k_1 Value (cps/h)');
set(gca,'xscale','log');
hold on;
% figure;
% 
% m = 10;
% x1 = [];
% y1 = [];
% for i = 1:0.025:m
%     y0(1) = 10^i;
%     x1 = [x1; y0(1)];
%     [T,Y] = ode15s(@n089, tRange, y0);
%     y1 = [y1; Y(end,1)];
%                
% end
% plot(x1,y1,'--x');
% set(gca,'xscale','log');
% xlabel('The initial value of S');
% ylabel('The steady value of S');
% 
% figure;
% 
% 
% x2 = [];
% y2 = []; 
% for i = 1:1:m
%     k_1 = 10^i;
%     x2 = [x2;k_1];
%     [T,Y] = ode15s(@n089, tRange, y0);
%     y2 = [y2; Y(end,1)];
% end
% 
% plot(x2,y2,'--ro');
% set(gca,'xscale','log');
% xlabel('The initial value of k_1');
% ylabel('The steady value of S');


