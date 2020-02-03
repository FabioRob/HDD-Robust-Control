% Defining uncertain parameters
J=ureal('J',6.3857e-6,'Percentage',[-10,10]);          % arm inertia in kg/m^2
kt=ureal('kt',9.183e-2,'Percentage',[-10,10]);           % VCM torque constant in N*m/A
ky=ureal('ky',1.2,'Percentage',[-5,5]);                     % position measurement gain in V/track
w1=ureal('w1',2*pi*50,'Percentage',[-5,5]);              % pivot bearing resonance frequency in rad/s
w2=ureal('w2',2*pi*2200,'Percentage',[-12,12]);       % first torsional resonance frequency in rad/s
w3=ureal('w3',2*pi*6400,'Percentage',[-8,8]);           % second torsional resonance frequency in rad/s
w4=ureal('w4',2*pi*8800,'Percentage',[-15,15]);       % first sway resonance frequency in rad/s
psi1=ureal('psi1',0.05,'Percentage',[-5,5]);              % first resonance damping
psi2=ureal('psi2',0.024,'Percentage',[-8,8]);             % second resonance damping
psi3=ureal('psi3',0.129,'Percentage',[-10,10]);         % third resonance damping
psi4=ureal('psi4',0.173,'Percentage',[-10,10]);          % fourth resonance damping
% Defining fixed parameters
kb=9.183e-2;        % back e.m.f. constant in N*m/A
R=5.08e-2;           % arm lenght in m
kpa=10;                % amplifier gain in V/V
tpm=1e6;              % tracks per meter
Rcoil=8;                % coil resistance in Ohm
Rs=0.2;                 % sense resistance in the power amplifier feedback in Ohm
Lcoil=0.001;           % coil inductance in H
emax=12;              % saturated power amplifier voltage in V
RPM=7200;           % disk rotation rate in rev/min
tw=1e-6;                % track width in m
b1=0.006;              % first resonance coupling
b2=0;                    % first resonance coupling
b3=0.013;             % second resonance coupling
b4=-0.0018;          % second resonance coupling
b5=0.723;             % third resonance coupling
b6=-0.0015;          % third resonance coupling
b7=0.235;             % fourth resonance coupling
b8=-0.0263;          % fourth resonance coupling

Rc=Rcoil+Rs;      % VC static admittance in Ohm
tau=Lcoil/Rc;       % time constant of VC admittance transfer function in s


