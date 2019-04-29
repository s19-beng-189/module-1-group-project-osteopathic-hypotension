%filename: sa.m
clear all % clear all variables
clf       % and figures
global T TS TMAX QMAX;
global Psa dt Rl Ru Csa;
in_sa %initialization

for klok=1:klokmax
  t   = klok*dt;
  [Rs, Ru]  = Rs_new(Ru,Rl,t,Tstand);
  tc  = rem(t,T);
  if (tc < dt)
      F = F_now(Rs,Psa,Csa, Csv, CR, V0);
      T = 1/F
      TS   = 0.4*T;        % Duration of systole   (minutes)
      TMAX = 0.4*TS;       % Time at which flow is max (minutes)
  end
  tc2 = rem(t,Tstand+1);
  if (tc2<dt)
      QMAX = 1.5*QMAX
  end
  QAo = QAo_now(t);
  [Vl, Vu] = V(QAo,t);
  Psa =Psa_new(Psa,QAo,Rs, Csa, dt); %new Psa overwrites old
  %Store values in arrays for future plotting:
  t_plot(klok)  =t;
  QAo_plot(klok)=QAo;
  Psa_plot(klok)=Psa;
  T_plot(klok) = T;
  Rs_plot(klok) = Rs;
end

%Now plot results in one figure 
%with QAo(t) in upper frame
% and Psa(t) in lower frame
subplot(3,1,1), plot(t_plot,QAo_plot)
subplot(3,1,2), plot(t_plot,Psa_plot)
subplot(3,1,3), plot(t_plot,Rs_plot)
