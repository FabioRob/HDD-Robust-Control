% Transient response to step references and step disturbances, control
% action, open loop bode plot and complementary sensitivity bode plot of
% nominal plant controlled with Hinfinite controller.
  Linf_nom=Kinf*Gunom;              % nominal open loop transfer function from r to y
 Sinf_nom=(1+Kinf*Gunom)^-1;    % nominal sensibility function(transfer function from r to PES)
 Sd2PES_inf_nom=-0.0005*Gdnom*Sinf_nom;  % nominal tf from disturbance( 0.0005Nm amplitude step) to PES
 Tinf_nom=1-Sinf_nom;               % nominal complementary sensibility function(tf from r to y)
 Su_inf_nom=Kinf*Sinf_nom;       % nominal control sensibility function(from r to u)
 Sud_inf_nom=0.0005*Kinf*Sinf_nom*Gdnom;  % nominal transfer function from disturbance(0.0005Nm amplitude step) to u
 
 figure(1)
 step(Sinf_nom)
  title(' reference to PES with Hinfcontroller')
 figure(2)
 step(Sd2PES_inf_nom,4e-3)
 title('disturbance to PES with Hinf controller')
 figure(3)
 step(Su_inf_nom)
   title('control action with Hinf controller')
 figure(4)
 bode(Linf_nom)
 title( 'bode plot of open loop tf with Hinf controller')
 figure(5)
 bodemag(Tinf_nom)
  title('bode plot of closed loop tf with Hinf controller')

 
  
  
 Step_nom_hinf=stepinfo(Tinf_nom,'SettlingTimeThreshold',0.05);   % computes step response caracteristic (settling time,overshoot,etc)
 [Gm_hinf,Pm_hinf,Wgm_hinf,Wpm_hinf] = margin(Linf_nom);       % computes gain and phase margins
 
 % Uncertain transfer functions
 Lop_inf_unc=Kinf*Gu;
 S_inf_unc=(1+Lop_inf_unc)^-1;
 T_inf_unc=1-S_inf_unc;
 Su_inf_unc=Kinf*S_inf_unc;
 
 %[stabmarg_hinf,maxpRS_hinf] = robstab(T_inf_unc);    % computes robust stability margin and critical values of parameters
 %[perfmarg_hinf,maxpRP_hinf] = robgain(T_inf_unc,2); % computes robust performance margin with respect to a max peak in T of 2 and critical values of parameters

 figure(6)
 step(T_inf_unc)
 title('response to reference with Hinf controller for some perturbations')
 figure(7)
 step(Su_inf_unc)
 title('control action with Hinf controller for some perturbations')
 