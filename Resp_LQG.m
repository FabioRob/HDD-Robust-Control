% Transient response to step references and step disturbances, control
% action, open loop bode plot and complementary sensitivity bode plot of
% nominal plant controlled with LQG controller.

 Llqg_nom=Klqg*Gunom;              % nominal open loop transfer function from r to y
 Slqg_nom=inv(1+Klqg*Gunom);    % nominal sensibility function((transfer function from r to PES)
 Sd2PES_lqg_nom=-0.0005*Gdnom*Slqg_nom;  % nominal tf from disturbance( 0.0005Nm amplitude step) to PES
 Tlqg_nom=1-Slqg_nom;               % nominal complementary sensibility function(tf from r to y)
 Su_lqg_nom=Klqg*Slqg_nom;       % nominal control sensibility function(from r to u)
 Sud_lqg_nom=0.0005*Klqg*Slqg_nom*Gdnom;  % nominal transfer function from disturbance( 0.0005Nm amplitude step)  to u
 
 figure(1)
 step(Slqg_nom)
  title(' reference to PES with LQG controller')
 figure(2)
 step(Sd2PES_lqg_nom,4e-3)
 title('disturbance to PES with LQG controller')
 figure(3)
 step(Su_lqg_nom)
 title('control action with LQG controller')
 figure(4)
 bode(Llqg_nom)
 title( 'bode plot of open loop tf with LQG controller')
 figure(5)
 bodemag(Tlqg_nom)
  title('bode plot of closed loop tf with LQG controller')

 
  
  
 Step_nom_lqg=stepinfo(Tlqg_nom,'SettlingTimeThreshold',0.05);   % computes step response caracteristic (settling time,overshoot,etc)
 [Gm_lqg,Pm_lqg,Wgm_lqg,Wpm_lqg] = margin(Llqg_nom);       % computes gain and phase margins
 
 % Uncertain transfer functions
 Lop_lqg_unc=Klqg*Gu;
 S_lqg_unc=(1+Lop_lqg_unc)^-1;
 T_lqg_unc=1-S_lqg_unc;
 Su_lqg_unc=Klqg*S_lqg_unc;
 
 %[stabmarg_lqg,maxpRS_lqg] = robstab(T_lqg_unc);    % computes robust stability margin and critical values of parameters
 %[perfmarg_lqg,maxpRP_lqg] = robgain(T_lqg_unc,2); % computes robust performance margin with respect to a max peak in T of 

 figure(6)
 step(S_lqg_unc)
 title('reference to PES with LQG controller for some perturbations')
 figure(7)
 step(Su_lqg_unc)
 title('control action with LQG controller for some perturbations')