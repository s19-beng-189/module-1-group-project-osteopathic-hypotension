function F = F_now(V,Rs)
global Csa Csv CR
F = (P_sp*Csv)/(Rs*CR*(V-Csa*P_sp));
end