# HDD-Robust-Control
Robust control of an Hard Disk Drive with Matlab

The scope of this project is to develop a controller which ensures strict closed loop specifications and robustness to uncertaintes, disturbes and noise.

Model parameters are generated with ModelParameters.m

System transfer function G(s)=[Gu(s) Gd(s)] is obtained with PlantModel.m while weighting functions(M,Wn,Wp,Wu) and general plant(P) through WeightingFunctions.m and GeneralizedPlant.m , respectively.

Five controllers are developed through cl_design.m, LQG_design.m, LTR_design.m, Hinf_design.m and mu_design.m

Responses(PES,u) to step reference and disturb(0.0005 Nm) , both nominal and for some perturbations, besides open loop and closed loop Bode diagrams, are generated with Resp_cl.m, Resp_LQG.m, Resp_LTR.m, Resp_Hinf.m and Resp_mu.m

Nominal Performance, Robust Stability and Robust Performance analysis are performed in cl_analysis.m, LQG_analysis.m, LTR_analysis.m, Hinf_analysis.m, mu_analysis.m and NP_RS_RP_comparison.m

In addition, MaxPert_inf.m and MaxPert_mu.m computes the worst perturbation cases for the controlled plant in terms of Robust Stability and Robust Performance.

Finally , the parameters necessary to use the GUI HDD_controllerDesign.mlapp are initialized with init.mat
