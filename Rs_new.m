function [Rs, Rl_new, Ru_new] =Rs_new(Rl_old,Ru_old,t)
%filename:   Rs_new.m
global Rl Ru Tstand;
Rs=(Rl*Ru)/(Rl+Ru)
if t<Tstand
    Rl=1.5*Ru
end
if t==Tstand
    Rl=2*Ru
end
end
