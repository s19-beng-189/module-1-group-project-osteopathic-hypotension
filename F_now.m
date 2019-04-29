function F = F_now(Rs,Psa,Csa, Csv, CR, V0)
F = (100*Csv)/(Rs*CR*(V0-Csa*100));
end