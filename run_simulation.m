% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                                                                         %
%              The p53 network model by Hat et al. (2016).                %
%                                                                         %
%  This is the *main script* ("driver") for simulating dynamics of the    %
%  complete model (= core + apoptotic module + cell cycle arrest module). %
%                                                                         %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


%% Simulation protocol settings

sec_ = 1;  min_= 60*sec_;  hour_ = 60*min_;  day_ = 24*hour_;
%
tp1 = 30*day_;      % duration of the pre-irradiation (equilibration) phase
tp2 = 10*min_;      % duration of the irradiation phase
tp3 =  3*day_;      % duration of the post-irradiation (relaxation) phase
%
dt = 10*sec_;       % trajectory: timepoints interval
tspan1 = 0:dt:tp1;  % trajectory: timepoints of the equilibration phase
tspan2 = 0:dt:tp2;  % trajectory: timepoints of the irradiation phase
tspan3 = 0:dt:tp3;  % trajectory: timepoints of the relaxation phase


%% Irradiation parameters

global IR_Gy;            % plotting script can access the value
IR_Gy = 2.0;             % radiation dose [critical = ~4.05]

DNA_DSB_per_IR_Gy = 10;  % expected number of DSB (with slow repair rate) per 1 Gy [Ma et al. 2005]
global DNA_DSB_due_to_IR;
DNA_DSB_due_to_IR = IR_Gy*DNA_DSB_per_IR_Gy/tp2; % irradiation phase duration-
                                                 % adjusted rate

%% Initial conditions

global Rb_tot;  global SIAH1_tot;  global Bad_tot;  global BclXL_tot;
Rb_tot    = 3e5;
SIAH1_tot = 1e5;
Bad_tot   = 6e4;   % [BMC Syst.Biol.2013:: gate AND: 6e4, gate OR: 2e5] 
BclXL_tot = 1e5;   % [BMC Syst.Biol.2013: 1e5]

%------------------------------------------------
y0 = zeros(1,33);
y0( 1) =  0;        % DNA_DSB (DNA damage)
y0( 2) =  0;        % ATM_p
y0( 3) = SIAH1_tot; % SIAH1_0
y0( 4) =  0;        % HIPK2
y0( 5) =  0;        % p53_0p
y0( 6) =  0;        % p53_arrester
y0( 7) =  0;        % p53_S46p
y0( 8) =  0;        % p53_killer
y0( 9) =  0;        % Mdm2 mRNA
y0(10) =  0;        % Mdm2_cyt_0p
y0(11) =  0;        % Mdm2_cyt_S166S186p
y0(12) =  0;        % Mdm2_nuc_S166S186p
y0(13) =  0;        % Mdm2_nuc_S166S186p_S395p
y0(14) =  0;        % Wip1 mRNA
y0(15) =  0;        % Wip1
y0(16) =  0;        % PTEN mRNA
y0(17) =  0;        % PTEN
y0(18) =  0;        % PIP3
y0(19) =  0;        % AKT_p
%------------------------------------------------
y0(20) =  0;        % p21 mRNA
y0(21) =  0;        % p21 (free)
y0(22) = Rb_tot;    % Rb1_0 (free)
y0(23) =  0;        % Rb1_0:E2F1 complex
y0(24) =  0;        % Cyclin_E (free)
y0(25) =  0;        % Cyclin_E:p21 complex
%------------------------------------------------
y0(26) =  0;        % Bax mRNA
y0(27) =  0;        % Bax (free)
y0(28) = BclXL_tot; % BclXL (free)
y0(29) =  0;        % Bax:BclXL complex
y0(30) = Bad_tot;   % Bad_0 (free)
y0(31) =  0;        % Bad_p (free)
y0(32) =  0;        % proCaspase
y0(33) =  0;        % Caspase (active)
%------------------------------------------------
%
% (Values above are only initial molecule abundancies.
%  Proper protein levels are obtained in equilibrium.)


%% Simulation

global is_IR_switched_on;

% Phase 1 (equilibration):
is_IR_switched_on = 0;
[t1,Y1] = ode23tb(@p53_network,tspan1,y0);

% Phase 2 (irradiation):
% 
is_IR_switched_on = 1;
[t2,Y2] = ode23tb(@p53_network,tspan2,Y1(end,:));

% Phase 3 (relaxation):
%  
is_IR_switched_on = 0;  
[t3,Y3] = ode23tb(@p53_network,tspan3,Y2(end,:));


%% Plotting
%
T = [ t1 - t1(end);  t2;  t2(end) + t3 ]; % shift timepoints so that IR phase 
T = T / hour_;                            % begins at t = 0; set unit to hour
Y = [ Y1; Y2; Y3 ];
%
make_plots(T,Y);
