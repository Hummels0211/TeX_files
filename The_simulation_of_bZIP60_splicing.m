% This is the simulation of bZIP60 splicing model.
% Filename: The simulation of bZIP60 splicing.m 
% The main components in this model are: s_1, s_2, s_3, s_4, s_5, s_6.
% ----------
% The meaning of each component:
% ----------
% s_1: bzip60 DNA
% s_2: bzip60 mRNA, unspliced form
% s_3: bzip60 mRNA, spliced form
% s_4: bZIP60s protein
% s_5: The intermediate state of bzip60 mRNA during the splicing process
% s_6: The IRE1, which acts as the enzyme to catalyse the splicing of bzip60 mRNA
% ----------

close all
clear all

% ----------
% Setting the golbal variables:
% ----------

global s_1;
global s_2;
global s_3;
global s_4;
global s_5;
global s_6;

% ----------
% The parameters used in the model:
% ----------
% a: The source of bzip60 gene (DNA)
% A: The source of IRE1, the enzyme, in inactivated form
% S_n: The (s)y(n)thesis constant of transcription process, from bzip60 DNA to unspliced form mRNA
% T: The (t)ranslation constant in the process which bzip60 spliced mRNA becomes protein
% b_1: The reaction constant in the first-step splicing
% b_2: The reaction constant in the second-step splicing
% p: The su(p)press effect of IRE1 activation by bZIP60 protein
% d_1: The degradation rate of bzip60 unspliced mRNA
% d_2: The degradation rate of bzip60 spliced mRNA
% D_1: The degradation rate of bZIP60 protein
% D_2: The deactivation rate of IRE1
% ----------
% The value of the parameters:
% ----------

a = 0.5;
A = 0.5;
S_n = 0.85; 
T = 0.70;
b_1 = 0.75;
b_2 = 0.70;
p = 5.0;
d_1 = 0.20;
d_2 = 0.10;
D_1 = 0.15;
D_2 = 0.10;
n = 1.5;

% ----------
% The initial condition:
% ----------

s_10 = 0;
s_20 = 0;
s_30 = 0;
s_40 = 0;
s_50 = 0;
s_60 = 0;

% ----------
% The ODE equations:
% ----------
% ds_1/dt = - S_n*s_1 + a
% ds_2/dt = S_n*s_1 - d_1*s_2 - b_1*s_2*s_6
% ds_3/dt = - d_2*s_3 + b_2*s_5*s_6 - T*s_3
% ds_4/dt = T*s_3 - D_1*s_4 - D_2*s_4*s_6
% ds_5/dt = b_1*s_2*s_6 - b_2*s_5*s_6
% ds_6/dt = A/(p(1+(s_4)^n)) - D_2*s_4*s_6
% ----------

tic;
t = 0:0.25:50;

% ----------
% Setting:
% ----------
% ds_1 -> st1
% ds_2 -> st2
% ds_3 -> st3
% ds_4 -> st4
% ds_5 -> st5
% ds_6 -> st6
% ----------

st1 = - S_n*s_1 + a
st2 = S_n*s_1 - d_1*s_2 - b_1*s_2*s_6
st3 = - d_2*s_3 + b_2*s_5*s_6 - T*s_3
st4 = T*s_3 - D_1*s_4 - D_2*s_4*s_6
st5 = b_1*s_2*s_6 - b_2*s_5*s_6
st6 = A\(p(1+(s_4)^n)) - D_2*s_4*s_6

% ----------
% Plotting:
% ----------
plot(t,s_1);
plot(t,s_2);
plot(t,s_3);
plot(t,s_4);
plot(t,s_5);
plot(t,s_6);

% ----------
% ----------
