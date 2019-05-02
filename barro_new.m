function [F_new, Psv_new, Rs_new] = barro_new(F, SP, t)
% Baroreceptor Loop Function: Senses deviations from normal Psa values and
% adjusts Heart Rate, Systemic Resistance Systemic and Venous Pressure through SNS pathway
global Psv Rs Tstand;
thr_SP = 120;          % Keep regulating until threshold systolic pressure is reached
lag    =  0;           % delay in min
alphaF =  0.05;        % Recovery Rate Constant for Heart Rate
alphaP =  0.0005;      % Recovery Rate Constant for Psv
alphaR =  0.1 ;        % Recovery Rate Constant for Rs
%alphaR = 0; %Test for seperate compensations
%alphaF = 0;
%alphaP = 0;
if SP < thr_SP && t>lag+Tstand         % Adjust until normal levels are reached (120 mmHg) Adjust based on experiemtn
    dP = alphaP/Psv; 
    dF = alphaF/F;
    dR = alphaR/Rs;
    F_new = F + dF;
    Psv_new = Psv + dP;
    Rs_new = Rs + dR;
else
    F_new = F;
    Psv_new = Psv;
    Rs_new = Rs;
end
 
end