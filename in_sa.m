%filename: in_sa.m  (initialization for the script sa)
Tstand  = 2.5;          % minutes
T       = 0.0125;       % Initial Duration of heartbeat (minutes)
TS      = 0.4*T;        % Duration of systole   (minutes)
TMAX    = 0.4*TS;       % Time at which flow is max (minutes)
QMAX    = 28.0;         % Max flow through aortic valve (liters/minute)
V0      = 5;            % Total Volume (liters)
% Rs      = 17.86;        % Systemic resistance (mmHg/(liter/minute))
Rl      = (178.6/6);      % Intial Upper systemic Resisitance (mmHg/(liter/minute))
Ru      = (178.6/4);      % Initial Lower systemic Resistance (mmHg/(liter/minute))
Csa     = 0.00111;      % Systemic arterial compliance (liters/(mmHg))
Csv     = 1.75;         % Systemic venous compliance (liters/mmHg)
CR      = 0.0365;       % Max (diastolic) value of Compliance of Right Heart (liters/mmHg)
dt      = 0.000075;     % Time step duration (minutes). Optimized for < 1% error
klokmax = round(10/dt); % Total number of timesteps adjusted to equal 10 min
Psa     = 80;           % Set Point Psa (mmHg)
F=0;
%Initialize arrays to store data for plotting:
t_plot = zeros(1,klokmax);
QAo_plot = zeros(1,klokmax);
Psa_plot = zeros(1,klokmax);


