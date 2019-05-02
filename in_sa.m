%filename: in_sa.m  (initialization for the script sa)
Rs      = 17.86;        % Systemic resistance (mmHg/(liter/minute))
Rs = Rs/2 %test for weed smoking;
%Rl      = (178.6/4);    % Intial Upper systemic Resisitance (mmHg/(liter/minute))
%Ru      = (178.6/6);    % Initial Lower systemic Resistance (mmHg/(liter/minute))
Csa     = 0.00105;      % Systemic arterial compliance (liters/(mmHg))
%Csa     = Csa/2 %test age
Csv     = 2.5874;       % Systemic venous compliance (liters/mmHg)
CR      = 0.0365;       % Diastolic Compliance of Right Heart (liters/mmHg)
dt      = 0.0001;       % Time step duration (minutes)
klokmax = round(8/dt);  % Total number of timesteps adjusted to equal 10 min
Psp     = 80;           % Set Point Psa (mmHg)
Psa     = 80;           % initial Psa
Psv     = 1.9;          % initial Systemic venous pressure (mmHg)
Tstand  = 0.5;          % Time at which person stands minutes
T       = 0.0125;       % Initial Duration of heartbeat (minutes)
T = T/1.5 %50% increas in HR for weed smoking
TS      = 0.4*T;        % Duration of systole   (minutes)
TMAX    = 0.4*TS;       % Time at which flow is max (minutes)
QMAX    = 2*CR*Psv/TS;  % Max flow through aortic valve (liters/minute)
SV      = QMAX*TS/2;    % Stroke Volume (liters)
F       = 1/T;          % Initial heart rate (bpm)

%Initialize arrays to store data for plotting:
t_plot = zeros(1,klokmax);
QAo_plot = zeros(1,klokmax);
Psa_plot = zeros(1,klokmax);
HR_plot = zeros(1,klokmax);
QMAX_plot = zeros(1,klokmax);
Rs_plot = zeros(1,klokmax);
Psv_plot = zeros(1,klokmax);
SV_plot = zeros(1,klokmax);
Tcount_plot=zeros(1,klokmax);
SP_plot = zeros(1,klokmax);
DP_plot = zeros(1,klokmax);



