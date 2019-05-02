function QMAX_new = barro(QMAX,Psa,klok,T,dt)
period = round(T/dt);
if klok > period
    SP = max(Psa_plot(klok-period:klok));
    DP = Psa;
    drop_SP = 20;   % Drop in Systolic Pressure to sense (mmHg)
    drop_DP = 10;   % Drop in Diastolic Pressure to sense (mmHg)
    if ((150-SP)>drop_SP)  %Recovery Limit
        dQ = 1.1/QMAX; %Recovery Rate
        QMAX_new = QMAX + dQ;
        
    else
        %QMAX_new = QMAX;
    end
else
    QMAX_new = QMAX;
end
end