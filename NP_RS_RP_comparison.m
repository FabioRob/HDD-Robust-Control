% NP,RS,RP comparison between Hinfinite and mu controllers

% Nominal Performance(only Hinf and mu have)
figure
semilogx(sv_hinf(1,:),sv_mu(1,:))
legend(' Nominal Performance Hinf controller ','Nominal Performance mu controller ')

% Robust Stability(all)
figure
semilogx(muRS_cl,'--',muRS_lqg,'g',muRS_ltr,'k',muRS_hinf,'b',muRS_mu,'r')
legend(' Robust Stability classic controller ',' Robust Stability LQG controller ',' Robust Stability LTR controller ',' Robust Stability Hinf controller ','Robust Stability mu controller ','Location','northwest')
title('Robust Stability')
ylabel('ssv(M)')
xlabel('frequencies(rad/s)')

% Robust Performance(only Hinf and mu have)
figure
semilogx(mu_hinf_RP(:,1),mu_mu_RP(:,1))
legend(' Robust Performance Hinf controller ','Robust Performance mu controller ')

