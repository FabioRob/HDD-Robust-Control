% design of LQG controller

[A,B,C,D]=ssdata(Gunom);
n=length(A);
Q=eye(n);
W=eye(n);
V=1;
Qweight=blkdiag(Q,1);
Qnoise=blkdiag(W,V);
Klqg=lqg(Gunom,Qweight,Qnoise,1,'1dof');   % computes LQG controller 

