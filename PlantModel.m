% Defining the uncertain plant model G
load Parameters.mat
Gvca=tf(Rc^-1,[tau,1]);    % Voice Coile admittance transfer function
                 
A1=[0 w1; -w1 -2*psi1*w1];
B1=[0;w1];
C1=[b1 b2];
G1=uss(A1,B1,C1,0);       % First resonant mode
A2=[0 w2; -w2 -2*psi2*w2];
B2=[0;w2];
C2=[b3 b4];
G2=uss(A2,B2,C2,0);       % Second resonant mode
A3=[0 w3; -w3 -2*psi3*w3];
B3=[0;w3];
C3=[b5 b6];
G3=uss(A3,B3,C3,0);       % Third resonant mode
A4=[0 w4; -w4 -2*psi4*w4];
B4=[0;w4];
C4=[b7 b8];
G4=uss(A4,B4,C4,0);       % Fourth resonant mode

Rot_f_int=uss(0,1/J,1,0);  % First integrator in arm rotational dynamic
Rot_s_int=ss(0,R*tpm,1,0);  % Second integrator in arm rotational dynamic

systemnames= ' kpa kb Rs Gvca kt G1 G2 G3 G4  Rot_f_int  Rot_s_int  ky';
inputvar= '[td;u]';
outputvar='[ky]';
input_to_kpa='[u-Rs]';
input_to_Gvca='[kpa-kb]';
input_to_Rs='[Gvca]';
input_to_kt='[Gvca]';
input_to_G1='[kt+td]';
input_to_G2='[kt+td]';
input_to_G3='[kt+td]';
input_to_G4='[kt+td]';
input_to_Rot_f_int='[G1+G2+G3+G4]';
input_to_kb='[Rot_f_int]';
input_to_Rot_s_int='[Rot_f_int]';
input_to_ky='[Rot_s_int]';
sysoutname = 'G';
cleanupsysic = 'yes';
sysic; 

Gd=G(1,1);    % transfer function from td to y

Gu=G(1,2);    % transfer function from u to y


%bode(Gu,'--')   % bode plot from u to y

%bode(Gd,'--')   % bode plot from td to y

Gnom=G.Nominalvalue;      % nominal transfer matrix from [td;u] to y

Gdnom=Gd.Nominalvalue;   % nominal transfer function from td to y

Gunom=Gu.Nominalvalue;  % nominal transfer function from u to y


% parameters for simulink models
Hd_nom=tf(G1.Nominalvalue+G2.Nominalvalue+G3.Nominalvalue+G4.Nominalvalue);  % Total resonant modes tf
kt_nom=kt.nom;
Jinv=1/J.nom;
ky_nom=ky.nom;
[A,B,C,D]=ssdata(Gunom);
