function [Psv_new] = standUp(t, Tstand, Psv_old)
%filename:   standUp.m
% Simulates Going from Supine to Standing Position
% At Tstand: Volume accumulates in lower extremities
% 1)Systemic Resistance, Rs, increases  
% 2)Central Venous Pressure, Psv, decreases (modeled here as Systemic Venous pressure)
if t==Tstand
    %Rl_new  = (2/3)*Rl_old;
    Psv_new = (0.75)*Psv_old;
else
    %Rl_new  = Rl_old;
    Psv_new = Psv_old;
    
end
%Rs =(Rl_new*Ru_old)/(Rl_new+Ru_old);
end