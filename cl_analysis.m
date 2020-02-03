% analysis of performances obtained with classic controller

om=logspace(1,5,100);
Ncl=lft(Pnom,Kcl);  % closed loop nominal transfer matrix
Ncl_unc=lft(P,Kcl); % closed loop uncertain transfer matrix
% Nominal Stability
NS_cl=isstable(Ncl);  % return 1 if system is internally stable(every transfer function in N is stable)

% Nominal Performance

sv_cl=sigma(Ncl,om);
sv_cl=frd(sv_cl(1,:),om);

 
 % Robust Stability
 [Mcl,Delta,blk]=lftdata(Ncl_unc);  % creates M-Delta structure to analyze robust stability with structured singular value
 Mcl=frd(Mcl,om);
 n=length(Delta);  % 11 uncertain parameters, 4 of which repetead twice(the resonant mode's frequencies)--> 15x15 DELTA matrix
 mu_cl_RS=mussv(Mcl(1:n,1:n),blk);   % structured singular value for RS analysis
 
 % Robust Performance
 
 DeltaP=ucomplexm('DeltaP',zeros(3,2));  % creates a fictitious uncertainty block with compatible dimension with closed loop transfer matrix
 Ncl_RP=lft(Ncl_unc,DeltaP);             
 [Mcl_RP,Delta,blk]=lftdata(Ncl_RP);   % creates the structure for robust performace analysis with structured singular value
 Mcl_RPfrd=frd(Mcl_RP,om);
 sz=size(Delta);
 mu_cl_RP=mussv(Mcl_RPfrd(1:sz(2),1:sz(1)),blk);   % structured singular value for RP analysis
 
 figure
 semilogx(sv_cl(1,:),mu_cl_RS(:,1),mu_cl_RP(:,1))
 legend(' Nominal Performance classic controller ',' Robust Stability classic controller ','Robust Performance classic controller ')

 
%[stabmarg,wcu] = robstab(T_cl_unc)
%[perfmarg,wcu] = robgain(T_cl_unc,2)

