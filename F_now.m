function F = F_now(Rs, Psa, Psv, Csa, Csv, CR, V0)
F = ((Psa-Psv)*Csv)/(Rs*CR*(V0-Csa*Psa));

end