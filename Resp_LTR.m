% Transient response to step references and step disturbances, control
% action, open loop bode plot and complementary sensitivity bode plot of
% nominal plant controlled with LTR controller.

 Lltr_nom=Kltr*Gunom;              % nominal open loop transfer function from r to y
 Sltr_nom=(1+Kltr*Gunom)^-1;    % nominal sensibility function((transfer function from r to PES)
 Sd2PES_ltr_nom=-0.0005*Gdnom*Sltr_nom;  % nominal tf from disturbance( 0.0005Nm amplitude step) to PES
 Tltr_nom=1-Sltr_nom;               % nominal complementary sensibility function(tf from r to y)
 Su_ltr_nom=Kltr*Sltr_nom;       % nominal control sensibility function(from r to u)
 Sud_ltr_nom=0.0005*Kltr*Sltr_nom*Gdnom;  % nominal transfer function from disturbance( 0.0005Nm amplitude step)  to u
 
 figure(1)
 step(Sltr_nom)
  title(' reference to PES with LTR controller')
 figure(2)
 step(Sd2PES_ltr_nom,4e-3)
 title('disturbance to PES with LTR controller')
 figure(3)
 step(Su_ltr_nom)
 title('control action with LTR controller')
 figure(4)
 bode(Lltr_nom)
 title( 'bode plot of open loop tf with LTR controller')
 figure(5)
 bodemag(Tltr_nom)
  title('bode plot of closed loop tf with LTR controller')

 
  
  
 Step_nom_lqg=stepinfo(Tltr_nom,'SettlingTimeThreshold',0.05);   % computes step response caracteristic (settling time,overshoot,etc)
 [Gm_lqg,Pm_lqg,Wgm_lqg,Wpm_lqg] = margin(Lltr_nom);       % computes gain and phase margins
 
 % Uncertain transfer functions
 Lop_ltr_unc=Kltr*Gu;
 S_ltr_unc=(1+Lop_ltr_unc)^-1;
 T_ltr_unc=1-S_ltr_unc;
 Su_ltr_unc=Kltr*S_ltr_unc;
 
 %[stabmarg_ltr,maxpRS_ltr] = robstab(T_ltr_unc);    % computes robust stability margin and critical values of parameters
 %[perfmarg_ltr,maxpRP_ltr] = robgain(T_ltr_unc,2); % computes robust performance margin with respect to a max peak in T of 

 figure(6)
 step(S_ltr_unc)
 title('reference to PES with LTR controller for some perturbations')
 figure(7)
 step(Su_ltr_unc)
 title('control action with LTR controller for some perturbations')