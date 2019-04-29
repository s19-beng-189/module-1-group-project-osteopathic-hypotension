function F = F_now(Rs,Psa,Csa, Csv, CR, V0)
F = (80*Csv)/(Rs*CR*(V0-Csa*80));
end