function F = F_now(Rs,Psa)
global Csa Csv CR V0
F = (Psa*Csv)/(Rs*CR*(V0-Csa*Psa));
end