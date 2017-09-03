clear all;

global Tm;

Tm = 0;
tRange = 0:1:10000; 
y0 = [10000, 50, 450, 30, 1000, 1000, 1000, 30];

[T,Y] = ode45(@n089_v2, tRange, y0);

figure;

subplot(4,2,1)
plot(T,Y(:,1),'m');
title('Protein Level');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,2)
plot(T,Y(:,2),'m');
title('Stress Level');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,3)
plot(T,Y(:,3),'b');
title('bZIP60u(z_{1u})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,4)
plot(T,Y(:,4),'k');
title('bZIP60s(z_{1s})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,5)
plot(T,Y(:,5),'r');
title('bZIP28(z_2)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,6)
plot(T,Y(:,6),'g');
title('BIP12(b_{12})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,7)
plot(T,Y(:,7),'y');
title('BIP3(b_{3})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;
hold on

subplot(4,2,8)
plot(T,Y(:,8),'c');
title('NAC089c(N_C)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
grid on;
grid minor;

figure;
y0 = Y(end,:);

tRange0 = [0:1:10];
tRange1 = [10:1:74];
tRange2 = [74:1:10000];
[T0,Y0] = ode45(@n089_v2,tRange0,y0);
Tm = 200;
y0 = Y0(end,:);
[T1,Y1] = ode45(@n089_v2, tRange1,y0);
y0 = Y1(end,:);
y_toc = max(Y1(:,7));
Tm = 200;
[T2,Y2] = ode45(@n089_v2,tRange2,y0);
T = [T0;T1;T2];
Y = [Y0;Y1;Y2];

subplot(4,2,1)
plot(T,Y(:,2));
title('Stress Level');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,2)
plot(T,Y(:,3));
title('bZIP60u(z_{1u})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,3)
plot(T,Y(:,4));
title('bZIP60s(z_{1s})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,4)
plot(T,Y(:,5));
title('bZIP28(z_2)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,5)
plot(T,Y(:,6));
title('BIP12(b_{12})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,6)
plot(T,Y(:,7));
title('BIP3(b_{3})');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;
hold on

subplot(4,2,7)
plot(T,Y(:,8));
title('NAC089c(N_C)');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
%grid on;
%grid minor;

subplot(4,2,8)
plot(T,Y(:,1),'m');
title('Protein Level');
xlabel('Time(t)');
set(gca,'xscale','log');
ylabel('Expression level');
