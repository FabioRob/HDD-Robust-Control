% analysis of performances obtained with mu controller

om=logspace(1,5,100);
Nmu=lft(Pnom,Kmu);  % closed loop nominal transfer matrix
Nmu_unc=lft(P,Kmu); % closed loop uncertain transfer matrix for the generalized plant  ( not the one used for mu-synthesis(in which every parameter were fixed except J,kt,ks))

% Nominal Stability
NS_mu=isstable(Nmu);  % return 1 if system is internally stable(every transfer function in N is stable)

% Nominal Performance

sv_mu=sigma(Nmu,om);
sv_mu=frd(sv_mu(1,:),om);

 
 % Robust Stability
 [Mmu,Delta,blk]=lftdata(Nmu_unc);  % creates M-Delta structure to analyze robust stability with structured singular value
 Mmu=frd(Mmu,om);
 n=length(Delta);  % 11 uncertain parameters, 4 of which repetead twice(the resonant mode's frequencies)--> 15x15 DELTA matrix
 mu_mu_RS=mussv(Mmu(1:n,1:n),blk);   % structured singular value for RS analysis
 
 % Robust Performance
 
 DeltaP=ucomplexm('DeltaP',zeros(3,2));  % creates a fictitious uncertainty block with compatible dimension with closed loop matrix N
 Nmu_RP=lft(Nmu_unc,DeltaP);             
 [Mmu_RP,Delta,blk]=lftdata(Nmu_RP);   % creates the structure for robust performace analysis with structured singular value
 Mmu_RPfrd=frd(Mmu_RP,om);
 sz=size(Delta);
 mu_mu_RP=mussv(Mmu_RPfrd(1:sz(2),1:sz(1)),blk);   % structured singular value for RP analysis
 
 figure
 semilogx(sv_mu(1,:),mu_mu_RS(:,1),mu_mu_RP(:,1))
 legend(' Nominal Performance mu controller ',' Robust Stability mu controller ','Robust Performance mu controller ')




