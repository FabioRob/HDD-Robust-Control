% design of mu controller
% taking into account in plant model for synthesis
% only uncertaintes in kt,ky,J(all other parametrs fixed)

        % uncertain plant used for mu synthesis
Pmu=usubs(P, 'w1','Nom', 'w2','Nom', 'w3','Nom', 'w4','Nom', 'psi1', ...
'Nom', 'psi2', 'Nom',  'psi3', 'Nom',  'psi4', 'Nom');  
om=logspace(2,5,100);
nmeas = 1;
ncon = 1;
opt=dkitopt('FrequencyVector',om, 'DisplayWhileAutoIter','off',...
    'NumberOfAutoIterations',3) ;
[Kmu,clp,bnd,dkinfo]=dksyn(Pmu,nmeas,ncon,opt); % computes mu controller


