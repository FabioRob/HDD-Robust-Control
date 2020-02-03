% Transient response to step references and step disturbances, control
% action, open loop bode plot and complementary sensitivity bode plot of
% nominal plant controlled with mu controller.
 Lmu_nom=Kmu*Gunom;              % nominal open loop transfer function from r to y
 Smu_nom=(1+Kmu*Gunom)^-1;    % nominal sensibility function(transfer function from r to PES)
 Sd2PES_mu_nom=-0.0005*Gdnom*Smu_nom;  % nominal tf from disturbance( 0.0005Nm amplitude step) to PES
 Tmu_nom=1-Smu_nom;               % nominal complementary sensibility function(tf from r to y)
 Su_mu_nom=Kmu*Smu_nom;       % nominal control sensibility function(from r to u)
 Sud_mu_nom=0.0005*Kmu*Smu_nom*Gdnom;  % nominal transfer function from disturbance( 0.0005Nm amplitude step) to u
 
 figure(1)
 step(Smu_nom)
  title(' reference to PES with mu controller')
 figure(2)
 step(Sd2PES_mu_nom,4e-3)
 title('disturbance to PES with mu controller')
 figure(3)
 step(Su_mu_nom)
   title('control action with mu controller')
 figure(4)
 bode(Lmu_nom)
 title( 'bode plot of open loop tf with mu controller')
 figure(5)
 bodemag(Tmu_nom)
  title('bode plot of closed loop tf with mu controller')
  
 Step_nom_mu=stepinfo(Tmu_nom,'SettlingTimeThreshold',0.03);   % computes step response caracteristic (settling time,overshoot,etc)
 [Gm_mu,Pm_mu,Wgm_mu,Wpm_mu] = margin(Lmu_nom);       % computes gain and phase margins
 
 % Uncertain transfer functions
 Lop_mu_unc=Kmu*Gu;
 S_mu_unc=(1+Lop_mu_unc)^-1;
 T_mu_unc=1-S_mu_unc;
 Su_mu_unc=Kmu*S_mu_unc;
 
 %[stabmarg_mu,max_pert_mu_RS] = robstab(T_mu_unc,om);   % computes robust stability margin.and critical values of parameters
 %[perfmarg_mu,max_pert_mu_RP] = robgain(T_mu_unc,1.585); % computes robust performance margin with respect to a max peak in T of 1.585 and critical values of parameters

 figure(6)
 step(T_mu_unc)
 title('response to reference with mu controller for some perturbations')
 figure(7)
 step(Su_mu_unc)
 title('control action with mu controller for some perturbations')
 

 