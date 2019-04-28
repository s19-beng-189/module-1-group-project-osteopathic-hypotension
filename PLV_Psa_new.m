function [PLV,Psa]=PLV_Psa_new(PLV_old,Psa_old,CLV_old,CLV,SMi,SAo)
%filename PLV_Psa_new.m
global Csa Rs RMi RAo dt CHECK PLA; %call on variables from the in_LV_sa file
C11=CLV+dt*((SMi/RMi)+(SAo/RAo)); % total pressure based on valves
C12=-dt*(SAo/RAo); %pressure on the aorta
C22=Csa+dt*((SAo/RAo)+(1/Rs)); % adding systemic pressure according to having the aorta
B1=CLV_old*PLV_old+dt*(SMi/RMi)*PLA; % change in the pressure
B2=Csa*Psa_old; %find the previous volumetric change
D=C11*C22-C12^2;
PLV=(B1*C22-B2*C12)/D; %pressure in the left ventricle
Psa=(B2*C11-B1*C12)/D; %pressure in the right ventricle
if (CHECK)  %make sure that everything makes sense, this auto checking can be turned off by setting CHECK =0
  LHS1=(CLV*PLV-CLV_old*PLV_old)/dt;
  RHS1=(SMi/RMi)*(PLA-PLV)-(SAo/RAo)*(PLV-Psa);
  CH1=RHS1-LHS1
  LHS2=Csa*(Psa-Psa_old)/dt;
  RHS2=(SAo/RAo)*(PLV-Psa)-(1/Rs)*Psa;
  CH2=RHS2-LHS2
end
