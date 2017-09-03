function nac089(S_0,t)
%NAC089 To calculate the expression level of NAC089, with the initial
%condition stress S_0 and at certain time point t.
%   To test the output of NAC089, set the initial stress level (S_0), and
%   time t:
%   For example, to generate the change of each component in the UPR, type 
%       nac(S_0,t)
global k_1 k_2 k_3 k_4 k_5 k_6 d_1 d_2 d_3 d_4 p_1 p_2 q_1 q_2 k_n1 k_n2 K_S ...
    k_b12 k_b3;
%List out all the constant parameter included in this model
k_1 = 50;                % Keeping the parameter a constant;
%k_1 = 0:0.05:3;        % Scanning the equations under the different ...
                        % value of one parameter
k_2 = 3;
%k_2 = 0:0.05:3;
k_3 = 4;
%k_3 = 0:0.05:3;
k_4 = 250;
%k_4 = 0:0.05:3;
k_5 = 200;
%k_5 = 0:0.05:3;
k_6 = 4.5;
%k_6 = 0:0.05:3;
k_n1 = 250;
%k_n1 = 0:0.05:3;
k_n2 = 150;
%k_n2 = 0:0.05:3;
K_S = 15;
%K_S = 0:0.05:3;
d_1 = 0.30;
%d_1 = 0:0.05:3;
d_2 = 0.30;
%d_2 = 0:0.05:3;
d_3 = 10;
%d_3 = 0:0.05:3;
d_4 = 10;
%d_4 = 0:0.05:3;
p_1 = 1;
%p_1 = 0:0.05:3;
q_1 = 1;
%q_1 = 0:0.05:3;
p_2 = 1;
%p_2 = 0:0.05:3;
q_2 = 1;
%q_2 = 0:0.05:3;
k_b12 = 9.0;
%k_b12 = 0:0.05:3;
k_b3 = 9.0;
%k_b3 = 0:0.05:3;

z1u0 = 0.2;    % The initial environment in the cell;
z1s0 = 0.2;
z20  = 0.3;
b120 = 0.2;
b30  = 0.20;
Nc0  = 0.12;
Vm = 1;

dt = t / 200;
ti = 0;
S = S_0;
z1u = z1u0;
z1s = z1s0;
z2 = z20;
b12 = b120;
b3 = b30;
Nc = Nc0;
St = zeros(200,1);
z_1u = zeros(200,1);
z_1s = zeros(200,1);
z_2 = zeros(200,1);
b_12 = zeros(200,1);
b_3 = zeros(200,1);
N_c = zeros(200,1);
T = zeros(200,1);

for i = 1:200;
    St(i)=S;
    z_1u(i)=z1u;
    z_1s(i)=z1s;
    z_2(i)=z2;
    b_12(i)=b12;
    b_3(i)=b3;
    N_c(i)=Nc;
    T(i)=ti;
    dSdt = k_1 * S - k_2 * S - k_3 * S - k_b12 * S * b12 - k_b3 * S * b3; 
    dz1udt = k_2 * S - (Vm * z1u)/(K_S + z1u) - d_1 * z1u;
    dz1sdt = (Vm * z1u)/(K_S + z1u) - d_2 * z1s - k_4 * z1s - ...
        k_n1 * ((z1s^(p_1))/(b3^(q_1)));
    dz2dt = k_3 * S - d_3 * z2 - k_5 * z2 - k_n2 * ((z2^(p_2))/(b12^(q_2)));
    db12dt = k_5 * z2 - k_b12 * S * b12;
    db3dt = k_4 * z1s - k_b3 * S * b3;
    dNcdt = k_n1 * ((z1s^(p_1))/(b3^(q_1))) + k_n2 * ((z2^(p_2))/(b12^(q_2))) + ...
        - d_4 * Nc - k_6 * Nc;
    S = S + dSdt * dt;
    z1u = z1u + dz1udt * dt;
    z1s = z1s + dz1sdt * dt;
    z2 = z2 + dz2dt * dt;
    b12 = b12 + db12dt * dt;
    b3 = b3 + db3dt * dt;
    Nc = Nc + dNcdt * dt;
    ti = ti + dt;
end

figure
plot(T,St,'y-',T,z_1u,'m.',T,z_1s,'c-.',T,z_2,'r-',T,b_12,'g.',T,b_3,'b-.',...
    T,N_c,'k-');
%plot(T,z_1u,'m.');
%plot(T,z_1s,'c-.');
%plot(T,z_2,'r-');
%plot(T,b_12,'g.');
%plot(T,b_3,'b-.');
%plot(T,N_c,'r-');
xlabel('time');
ylabel('concentration');

end

