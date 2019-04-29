function F = F_now(Rs,Psp, Csa, Csv, CR, V0)
F = (Psp*Csv)/(Rs*CR*(V0-Csa*Psp));
end