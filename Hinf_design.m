% design of Hinf optimal controller

nmeas = 1;
ncon = 1;
gmin = 0;
gmax = 10;
tol = 0.001;

[Kinf_opt,~,GAM] = hinfsyn(Pnom,nmeas,ncon,'GMIN',gmin,'GMAX',gmax,'TOLGAM',tol);

% taking a value of the infinite norm 10% higher than the minumim(GAM) in
% order to reduce the complexity of the controller(sub-optimal Hinf controller)
gmin=1.1*GAM;
[Kinf,CL,GAM] = hinfsyn(Pnom,nmeas,ncon,'GMIN',gmin,'GMAX',gmax,'TOLGAM',tol);

