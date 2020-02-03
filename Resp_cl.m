% Transient response to step references and step disturbances, control
% action, open loop bode plot and complementary sensitivity bode plot of
% nominal plant controlled with classic controller.

 Lcl_nom=Kcl*Gunom;              % nominal open loop transfer function from r to y
 Scl_nom=(1+Kcl*Gunom)^-1;    % nominal sensibility function(transfer function from r to PES)
 Sd2PES_cl_nom=-0.0005*Gdnom*Scl_nom;  % nominal tf from disturbance( 0.0005Nm amplitude step) to PES
 Tcl_nom=1-Scl_nom;               % nominal complementary sensibility function(tf from r to y)
 Su_cl_nom=Kcl*Scl_nom;       % nominal control sensibility function(from r to u)
 Sud_cl_nom=0.0005*Kcl*Scl_nom*Gdnom;  % nominal transfer function from disturbance(0.0005Nm amplitude step) to u
 
 figure(1)
 step(Scl_nom)
  title(' reference to PES with classic controller')
 figure(2)
 step(Sd2PES_cl_nom,4e-3)
 title('disturbance to PES with classic controller')
 figure(3)
 step(Su_cl_nom)
   title('control action with classic controller')
 figure(4)
 bode(Lcl_nom)
 title( 'bode plot of open loop tf with classic controller')
 figure(5)
 bodemag(Tcl_nom)
 title('bode plot of closed loop tf with classic controller')

 
  
  
 Step_nom_cl=stepinfo(Tcl_nom,'SettlingTimeThreshold',0.05);   % computes step response caracteristic (settling time,overshoot,etc)
 [Gm_cl,Pm_cl,Wgm_cl,Wpm_cl] = margin(Lcl_nom);         % computes gain and phase margins
 
 % Uncertain transfer functions
 Lop_cl_unc=Kcl*Gu;
 S_cl_unc=(1+Lop_cl_unc)^-1;
 T_cl_unc=1-S_cl_unc;
 Su_cl_unc=Kcl*S_cl_unc;
 
 %[stabmarg_cl,maxpRS_cl] = robstab(T_cl_unc);    % computes robust stability margin
 %[perfmarg_cl,maxpRP_cl] = robgain(T_cl_unc,2); % computes robust performance margin with respect to a max peak in T of 2

 figure(6)
 step(T_cl_unc)
 title('response to reference with classic controller for some perturbations')
 figure(7)
 step(Su_cl_unc)
 title('control action with classic controller for some perturbations')
 