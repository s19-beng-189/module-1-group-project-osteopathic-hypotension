function [F_new, Psv_new, Rs_new] = barro_new(F, SP, t)
% Baroreceptor Loop Function: Senses deviations from normal Psa values and
% adjusts Heart Rate, Systemic Resistance Systemic and Venous Pressure through SNS pathway
global Psv Rs Tstand;

lag    =  1;           % delay in min
alphaF =  0.05;        % Recovery Rate Constant for Heart Rate
alphaP =  0.0005;      % Recovery Rate Constant for Psv
alphaR =  0.1 ;     % Recovery Rate Consttant for Rs
if SP < 120 && t>lag+Tstand         % Adjust until normal levels are reached (120 mmHg)
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