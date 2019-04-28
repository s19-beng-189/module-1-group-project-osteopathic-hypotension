%filename:  LV_sa.m
clear all %clear all variables
clf       %and figures
global T TS tauS tauD; %pull variables from in_LV_sa for use in functions
global Csa Rs RMi RAo dt CHECK PLA; %same as above
in_LV_sa  %initialize
for klok=1:klokmax %forloop for filling the vectors in in_LV_sa
  t=klok*dt; %set the time by multiplying timestep with change in time
  PLV_old=PLV; %set the old left ventricle pressure value
  Psa_old=Psa; %set the old systemic pressure value
  CLV_old=CLV; %set old flow from the left ventricle
  CLV=CV_now(t,CLVS,CLVD); %find flow function based on systole or diastole
  %find self-consistent 
  %valve states and pressures:
  set_SMi_SAo %write new values until the heart completes a cycle
  %store in arrays for future plotting:
  t_plot(klok)=t; % write into time array
  CLV_plot(klok)=CLV; %write into flow array
  PLV_plot(klok)=PLV; %write into pressure array for left ventricle
  Psa_plot(klok)=Psa; %write into pressure array for systemic pressure
  VLV_plot(klok)=CLV*PLV+VLVd; %volume of the left ventricle
  Vsa_plot(klok)=Csa*Psa+Vsad; %systemic artery volume changes form pressure
  QMi_plot(klok)=SMi*(PLA-PLV)/RMi; %flow through the mitral valve
  QAo_plot(klok)=SAo*(PLV-Psa)/RAo; %flow through the aorta
  Qs_plot(klok)=Psa/Rs; %systemic flow 
  SMi_plot(klok)=SMi; %create a plot of cycling of SMi
  SAo_plot(klok)=SAo; %create a plot of cycling of SAo
end
%plot results:
figure(1)  
subplot(3,1,1), plot(t_plot,CLV_plot) % plot flow against time
subplot(3,1,2), plot(t_plot,PLV_plot,t_plot,Psa_plot) %plot ventricular and systemic pressures systemic in orange and ventricular in blue
subplot(3,1,3), plot(t_plot,QMi_plot,t_plot,QAo_plot,t_plot,Qs_plot) % plot flows through different parts of the body in response to changes in heart phase
%left ventricular pressure-volume loop
figure(2)
plot(VLV_plot,PLV_plot)
%systemic arterial pressure-volume ``loop''
figure(3)
plot(Vsa_plot,Psa_plot)
