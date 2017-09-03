function ire1ss
% This is the function to analyse the stability of the IRE1 model.
k_1 = 100;
k_2 = 0.2;

k_4 = 0.7;

k_z = 0.15;

k_b3 = 0.009;
k_n1 = 0.75;

K_S = 100;

K_3 = 100;
d_1 = 0.003;
d_2 = 0.003;

d_5 = 0.00125;

% p_1 = 1.0; The p_1 value may changed, set 1.0 as default.
% The parameters are replaced by \alpha, \beta. \gamma, \delta, ...
% \varepsilon and \zeta during the simplification of the equilibrium ...
% system.
alpha = (k_b3/k_2)*K_3;
beta = (d_1/k_1)*K_S;
gamma = k_z/k_2;
delta = (k_1/(d_5*K_3));
epsilon = d_2/k_4;
zeta = (k_n1/(k_4*K_3));

% The core equation f(z_1u*,s*)=0:
    %x = (k_2/k_1)*s;
    %y = +x/beta - (1/beta*delta)*(1+epsilon-(zeta/1+((1-x)/alpha*x)))...
    %*((1/(alpha*x))+delta)*(1-x);
syms x
f(x) = -x + (x*(1+x))/(1+(1-gamma)*x)-(1/(beta*delta))*(1+epsilon-...
((alpha*beta*zeta*((1+(1-gamma)*x)/(1+x)))/(((alpha-1)*beta*(x*(1+x)))/(1+(1-gamma)*x)+1)))...
*((((1+(1-gamma))*x)/(alpha*beta*x*(1+x)))+delta)*(1-((beta*x*(1+x))/(1+(1-gamma)*x)))
ezplot(f,[0,100]);
grid on;
%title({'\alpha is '; num2str(alpha); '\beta is '; num2str(beta); ...
%    '\gamma is '; num2str(gamma); '\delta is ';num2str(delta); ...
%    '\epsilon is ';num2str(epsilon); '\zeta is '; num2str(zeta)});
xlabel('z_{1u}');
title('The Steady State');
hold on;
