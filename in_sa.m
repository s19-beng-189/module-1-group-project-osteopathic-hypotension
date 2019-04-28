%filename: in_sa.m  (initialization for the script sa)
%T       = 0.0125;      % Duration of heartbeat (minutes)
global T
TS      = 0.4*T;        % Duration of systole   (minutes)
TMAX    = 0.4*TS;       % Time at which flow is max (minutes)
QMAX    = 28.0;         % Max flow through aortic valve (liters/minute)
% Rs      = 17.86;        % Systemic resistance (mmHg/(liter/minute))
Rl      = (175/4);      % Intial Upper systemic Resisitance (mmHg/(liter/minute))
Ru      = (175/6);      % Initial Lower systemic Resistance (mmHg/(liter/minute))
Csa     = 0.00111;      % Systemic arterial compliance (liters/(mmHg))
Csv     = 1.75;         % Systemic venous compliance (liters/mmHg)
CR      = 0.0365;       % Max (diastolic) value of Compliance of Right Heart (liters/mmHg)
dt      = 0.000075;     % Time step duration (minutes). Optimized for < 1% error
klokmax = round(10/dt); % Total number of timesteps adjusted to equal 10 min
P_sp    = 120;          % Set Point Psa (mmHg)

%Initialize arrays to store data for plotting:
t_plot = zeros(1,klokmax);
QAo_plot = zeros(1,klokmax);
Psa_plot = zeros(1,klokmax);


