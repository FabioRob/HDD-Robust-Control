% analysis of performances obtained with LQG controller

om=logspace(1,5,100);
Nlqg=lft(Pnom,Klqg);  % closed loop nominal transfer matrix
Nlqg_unc=lft(P,Klqg); % closed loop uncertain transfer matrix
% Nominal Stability
NS_lqg=isstable(Nlqg);  % return 1 if system is internally stable(every transfer function in N is stable)

% Nominal Performance

sv_lqg=sigma(Nlqg,om);
sv_lqg=frd(sv_lqg(1,:),om);

 
 % Robust Stability
 [Mlqg,Delta,blk]=lftdata(Nlqg_unc);  % creates M-Delta structure to analyze robust stability with structured singular value
 Mlqg=frd(Mlqg,om);
 n=length(Delta);  % 11 uncertain parameters, 4 of which repetead twice(the resonant mode's frequencies)--> 15x15 DELTA matrix
 mu_lqg_RS=mussv(Mlqg(1:n,1:n),blk);   % structured singular value for RS analysis
 
 % Robust Performance
 
 DeltaP=ucomplexm('DeltaP',zeros(3,2));  % creates a fictitious uncertainty block with compatible dimension with closed loop transfer matrix
 Nlqg_RP=lft(Nlqg_unc,DeltaP);             
 [Mlqg_RP,Delta,blk]=lftdata(Nlqg_RP);   % creates the structure for robust performace analysis with structured singular value
 Mlqg_RPfrd=frd(Mlqg_RP,om);
 sz=size(Delta);
 mu_lqg_RP=mussv(Mlqg_RPfrd(1:sz(2),1:sz(1)),blk);   % structured singular value for RP analysis
 
 figure
 semilogx(sv_lqg(1,:),mu_lqg_RS(:,1),mu_lqg_RP(:,1))
 legend(' Nominal Performance LQG controller ',' Robust Stability LQG controller ','Robust Performance LQG controller ')
