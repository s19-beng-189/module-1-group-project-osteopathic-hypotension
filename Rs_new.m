function [Rs, Rl_new] =Rs_new(Ru_old,Rl_old,t, Tstand)
%filename:   Rs_new.m
if t>=Tstand
    Rl=(2/3)*Rl_old;
else
    Rl=Rl_old;
    
end
Rs =(Rl*Ru_old)/(Rl+Ru_old);
Rl_new = Rl;
end

