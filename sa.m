%filename: sa.m
clear all % clear all variables
clf       % and figures
global T TS TMAX QMAX;
global Rs Csa dt rl ru;
in_sa %initialization
Csa=Csa/2
for klok=1:klokmax
  t=klok*dt;
  QAo=QAo_now(t);
  [Vl Vu] = V(t);
  Psa=Psa_new(Psa,QAo); %new Psa overwrites old
  %Store values in arrays for future plotting:
  t_plot(klok)=t;
  QAo_plot(klok)=QAo;
  Psa_plot(klok)=Psa;
  V1_plot(klok) = Vl;
  Vu_plot(klok) = Vu;
end
%Now plot results in one figure 
%with QAo(t) in upper frame
% and Psa(t) in lower frame
subplot(3,1,1), plot(t_plot,QAo_plot)
subplot(3,1,2), plot(t_plot,Psa_plot)
subplot(3,1,3), plot(t_plot,Vl_plot,t_plot,Vu_plot)
