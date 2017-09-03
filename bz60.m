function ret = bz60(t, y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global k_1;
% The global value list of parameters included in the model
k_1 = 4000;
k_2 = 0.2;
k_4 = 0.7;
k_6 = 0.15;
k_z = 0.90;
k_b3 = 0.009;
k_n1 = 0.75;
K_S = 1500.0;
K_3 = 100.0;
d_1 = 0.003;
d_2 = 0.003;
d_4 = 0.001;
d_5 = 0.00125;
%d_6 = 0.00125;
%k_41 = 2.0; The z_1s mRNA used for translation
p_1 = 1.0;

% Create a four-element vector for output data strorage.
ret = zeros(5,1);

% The value of each component
S = y(1);
z_1u = y(2);
z_1s = y(3);
b_3 = y(4);
N_c = y(5);

% The substitution of every variable in the model.
% S_star = (k_2/k_1)*S;
% z_1u_star = z_1u/K_S;
% z_1s_star = (k_4/(d_5*K_3))*z_1s;
% b_3_star = b_3/K_3;
% N_c_star = N_c;
% Using a diagonal transforming matrix:
v = [k_2/k_1, 1/K_S, k_4/(d_5*K_3), 1/K_3, 1];
T = diag(v);

% A new vector for the transformed variables
%z = T*(y');
%Z = z';

% Return the value of each component in this model.
ret(1) = k_1 - k_b3 * S * b_3 - k_2 * S;
%ret(1) = k_1 - k_b3 * b_3 - k_2 * S;
% Alternative stress accumulation method:
% ret(1) = k_1 * S - k_b3 * S * b_3 - k_2 * S;
ret(2) = k_2 * S - d_1 * z_1u - k_z * ((S * z_1u)/(K_S + z_1u));
ret(3) = k_z * ((S * z_1u)/(K_S + z_1u)) - d_2 * z_1s - k_4 * z_1s - ...
    k_n1 * (z_1s/(K_3 + b_3^p_1));
ret(4) = k_4 * z_1s - d_5 * b_3 - k_b3 * S* b_3;
ret(5) = k_n1 * (z_1s/(K_3 + b_3^p_1)) - d_4 * N_c - k_6 * N_c;


end

