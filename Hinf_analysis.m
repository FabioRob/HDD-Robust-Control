% analysis of performances obtained with Hinfinite controller

om=logspace(1,5,100);
Nhinf=lft(Pnom,Kinf);  % closed loop nominal transfer matrix
Nhinf_unc=lft(P,Kinf); % closed loop uncertain transfer matrix
% Nominal Stability
NS_hinf=isstable(Nhinf);  % return 1 if system is internally stable(every transfer function in N22 is stable)

% Nominal Performance

sv_hinf=sigma(Nhinf,om);
sv_hinf=frd(sv_hinf(1,:),om);

 
 % Robust Stability
 [Mhinf,Delta,blk]=lftdata(Nhinf_unc);  % creates M-Delta structure to analyze robust stability with structured singular value
 Mhinf=frd(Mhinf,om);
 n=length(Delta);  % 11 uncertain parameters, 4 of which repetead twice(the resonant mode's frequencies)--> 15x15 DELTA matrix
 mu_hinf_RS=mussv(Mhinf(1:n,1:n),blk);   % structured singular value for RS analysis
 
 % Robust Performance
 
 DeltaP=ucomplexm('DeltaP',zeros(3,2));  % creates a fictitious uncertainty block with compatible dimension with closed loop transfer matrix
 Nhinf_RP=lft(Nhinf_unc,DeltaP);             
 [Mhinf_RP,Delta,blk]=lftdata(Nhinf_RP);   % creates the structure for robust performace analysis with structured singular value
 Mhinf_RPfrd=frd(Mhinf_RP,om);
 sz=size(Delta);
 mu_hinf_RP=mussv(Mhinf_RPfrd(1:sz(2),1:sz(1)),blk);   % structured singular value for RP analysis
 
 figure
 semilogx(sv_hinf(1,:),mu_hinf_RS(:,1),mu_hinf_RP(:,1))
 legend(' Nominal Performance Hinf controller ',' Robust Stability Hinf controller ','Robust Performance Hinf controller ')

 


