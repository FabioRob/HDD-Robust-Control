% design of LTR controller

[A,B,C,D]=ssdata(Gunom);
w=logspace(2,5,500);
Xi = B*B'; Th = 200;            %  noise weighting
q  = 1e5; % recovery gain for Q:being a RHP zero at about 10^6 rad/s
 % the recover can be done only till frequencies below this limit;        
Q = C'*C; R = 200;              % initial control weight 
XiTh = diagmx(Xi,Th);           
[Kf] = lqrc(A',C',XiTh);        % Solve Kalman filter gain
Kf = Kf';                       % using duality with LQR
       
[Kltr,SVL,W1] = ltrsyn(Gunom,Kf,Q,R,q,w,'OUTPUT'); % computes LTR(on output) 
          % controller and plot nyquist plot of L2(s)=Gunom*Kltr
hold on
nyquist(A,Kf,C,0,1,w)   % nyquist plot of L4(s)= C*(sI-A)^-1*Kf