function Rs=Rs_new(Rl,Ru,t)
%filename:   Rs_new.m
global Rl Ru t;
Rs=(Rl*Ru)/(Rl+Ru)
if t==Tstand
    Rl=2*Ru
else
    Rl=1.5*Ru
end