%filename: sa.m
clear  % clear all variables
clf    % and figures
global T TS TMAX Tstand;
global Psv Rs Csa dt;
in_sa           % Initialize Parameters
Tcount = T;     % Initialize sum of Periods
reg = 0;        % Inititalize variable for regulation
SP = 120;       % Reference Systolic pressure
for klok=1:klokmax

  t = klok*dt;   %Current Time
  Psv = standUp(t, Tstand, Psv); % Update parameters for Standing Up
  
  if (t > Tcount) % Check at the start of every cardiac cycle
      
      period = round(T/dt);                 % Time steps in current cycle
      SP = max(Psa_plot(klok-period:klok)); % Systolic Pressure of last cycle
      if SP < 77 || reg         % Activate Barroreceptor Loop When SP drops by 20 mmHg or DP drops by 10 mmHg (Adjust based on experiment)
        [F, Psv, Rs] = barro_new(F, SP, t); % Activates Barroreceptor Loop
        reg = 1;  %keep regulating until 120/80
        trig = t; %time of signal response 
      end
      T = 1/F;
      Tcount = Tcount + T; % Sum of Periods
      TS   = 0.4*T;        % Duration of systole (min)
      TMAX = 0.4*TS;          % Time at which flow is max (min)
      QMAX = 2*CR*Psv/TS;     % Maximum Flow (L/min)
      SV   = QMAX*TS/2;       % Stroke Volume (L)

  end
  QAo = QAo_now(t,QMAX);        % Calculates Flow
  Psa = Psa_new_V(Psa,QAo); % Calculates new Psa values

  
  %Store values in arrays for future plotting:
  t_plot(klok)      = t;
  QAo_plot(klok)    = QAo;
  Psa_plot(klok)    = Psa;
  HR_plot(klok)     = 1/T;
  QMAX_plot(klok)   = QMAX;
  Rs_plot(klok)     = Rs;
  Psv_plot(klok)    = Psv;
  SV_plot(klok)     = SV;
end
SP_plot   = findpeaks(Psa_plot); %Systolic pressure values
DP_plot   = abs(findpeaks(-Psa_plot)); %Diastolic Pressure Values
t_SP      = linspace(t_plot(1),t_plot(end),length(SP_plot)); %corresponding time arrays
t_DP      = linspace(t_plot(1),t_plot(end),length(DP_plot));

% Plots
figure(1)
subplot(3,1,1), plot(t_plot,Psv_plot,'LineWidth',1.5)
xlabel('Time (min)','FontSize',14), ylabel('P_s_v (mmHg)','FontSize',14), title ('Compensatory Mechanisms','FontSize',16)
subplot(3,1,2), plot(t_plot,HR_plot,'LineWidth',1.5)
xlabel('Time (min)','FontSize',14), ylabel('Heart Rate (bpm)','FontSize',14)
subplot(3,1,3), plot(t_plot,Rs_plot,'LineWidth',1.5)
xlabel('Time (min)','FontSize',14), ylabel('Rs','FontSize',14)

figure(2)
%Reference Lines: %Adjust based on Experiment
x1 = 77*ones(length(t_SP));
x2 = 46*ones(length(t_SP));

subplot(2,1,1)
plot(t_SP, SP_plot,t_DP, DP_plot,t_SP,x1,'--k',t_SP,x2,'--k','LineWidth',1.5)
xlabel('Time (min)','FontSize',14), ylabel('Psa (mmHg)','FontSize',14)
legend('Systolic Pressure','Diastolic Pressure','FontSize',14)
subplot(2,1,2)
plot(t_plot, SV_plot,'LineWidth',1.5)
xlabel('Time (min)','FontSize',14), ylabel('Stroke Volume (L)','FontSize',14)
