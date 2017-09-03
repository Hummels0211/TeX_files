function polyb12
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global k_1 k_3 k_5 k_6 d_3 d_6 d_4 k_b12 k_n2 K_12 p_2 r
k_1 = 8.0;
k_3 = 0.7;
k_5 = 10.0;
k_6 = 0.8;
d_3 = 0.3;
d_6 = 0.50;
d_4 = 0.15;
k_b12 = 4.0;
k_n2 = 0.4;
K_12 = 5;
p_2 = 1;


c3 = d_6 * k_b12 * (k_5 + d_3);
c2 = (k_5 +d_3)*(k_b12 * k_1) + d_6 * k_b12 * k_n2 + d_6 * (K_12 * k_b12 ...
    + k_3)*(k_5 + d_3);
c1 = K_12 * (k_5 + d_3) * k_b12 * k_1 + k_b12 * k_1 * k_n2 + k_3 * d_6 * ...
    k_n2 + d_6 * (k_5 + d_3) * K_12 * k_3 - k_1 * k_3 * k_5;
c0 = - k_1 * k_3 * k_5 * K_12;
C = [c3, c2, c1, c0];
r = roots(C);
x = -80 : 0.2 : 60;
y = polyval(C,x);
subplot(2,2,1);
plot(x,y);
xlabel('b_{12}');
title('G(b_{12})');
hold on
y0 = zeros(3);
plot(r',y0','o');

subplot(2,2,3);
Cprime = [3*c3, 2*c2, c1];
rprime = roots(Cprime);
y2 = polyval(Cprime,x);
plot(x,y2);
xlabel('b_{12}');
title('G^{(1)}(b_{12})');
hold on
y0prime = zeros(2);
plot(rprime',y0prime','o');

subplot(2,2,2);
Cprime2 = [6*c3,2*c2];
y3 = polyval(Cprime2,x);
plot(x,y3);
xlabel('b_{12}');
title('G^{(2)}{b_12}');

end

