function QMAX_new = barro(QMAX,Psa_plot,klok,T,dt)
period = round(T/dt);
if klok > period
    SP = max(Psa_plot(klok-period:klok));
    if (150-SP)>20 %Recovery Limit
        dQ = 1.1/QMAX; %Recovery Rate
        QMAX_new = QMAX + dQ;
    else
        QMAX_new = QMAX;
    end
else
    QMAX_new = QMAX;
end
end