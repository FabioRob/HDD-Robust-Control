% analysis of performances obtained with LTR controller

om=logspace(1,5,100);
Nltr=lft(Pnom,Kltr);  % closed loop nominal transfer matrix
Nltr_unc=lft(P,Kltr); % closed loop uncertain transfer matrix
% Nominal Stability
NS_ltr=isstable(Nltr);  % return 1 if system is internally stable(every transfer function in N is stable)

% Nominal Performance

sv_ltr=sigma(Nltr,om);
sv_ltr=frd(sv_ltr(1,:),om);

 
 % Robust Stability
 [Mltr,Delta,blk]=lftdata(Nltr_unc);  % creates M-Delta structure to analyze robust stability with structured singular value
 Mltr=frd(Mltr,om);
 n=length(Delta);  % 11 uncertain parameters, 4 of which repetead twice(the resonant mode's frequencies)--> 15x15 DELTA matrix
 mu_ltr_RS=mussv(Mltr(1:n,1:n),blk);   % structured singular value for RS analysis
 
 % Robust Performance
 
 DeltaP=ucomplexm('DeltaP',zeros(3,2));  % creates a fictitious uncertainty block with compatible dimension with closed loop transfer matrix
 Nltr_RP=lft(Nltr_unc,DeltaP);             
 [Mltr_RP,Delta,blk]=lftdata(Nltr_RP);   % creates the structure for robust performace analysis with structured singular value
 Mltr_RPfrd=frd(Mltr_RP,om);
 sz=size(Delta);
 mu_ltr_RP=mussv(Mltr_RPfrd(1:sz(2),1:sz(1)),blk);   % structured singular value for RP analysis
 
 figure
 semilogx(sv_ltr(1,:),mu_ltr_RS(:,1),mu_ltr_RP(:,1))
 legend(' Nominal Performance LTR controller ',' Robust Stability LTR controller ','Robust Performance LTR controller ')
