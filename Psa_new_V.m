function Psa = Psa_new_V(Psa_old,QAo)
%filename:   Psa_new.m
global Psv Rs Csa dt;
% Calculates Psa taking Psv into account
Psa= (1/(Csa*Rs+dt))*(QAo*Rs*dt + Psv*dt + Csa*Rs*Psa_old);
end
