% Defining weighting function M,Wp,Wu

M=tf(1,[3.75e-9,1.2e-4,1]);   % ideal closed loop transfer function
                             % (no overshoot and settling time of 0.3ms)
%figure
%step(M)
Wn= 6e-4*tf([0.1,1],[0.01,1]);  % noise weighting function
     %(noise is 0.6 mV at low frequencies and 60mV at high frequencies
%figure
%bodemag(Wn)
Wp=1e-4*tf([1,8e4,1e8],[1,7e4,2.5e4]); %  performance weighting function

%figure
%bodemag(1/Wp)
%legend(' 1/|Wp| ')

Wu=1e-6*tf([0.55,1,1],[1e-4,2.1e-3,1]);  % control weighting function
%figure
%bodemag(Wu)
%legend(' |Wu| ')

