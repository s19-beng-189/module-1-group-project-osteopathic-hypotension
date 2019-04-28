function CV=CV_now(t,CVS,CVD) %call upon the function based on the time adn bsed on the systolic and the diastolic compliance/volume changes
%filename: CV_now.m
global T TS tauS tauD;
tc=rem(t,T); %tc=time in the current cycle, 
             %measured from start of systole.
if(tc<TS)   %measures the beginning of systole 
  e=(1-exp(-tc/tauS))/(1-exp(-TS/tauS)); %gives the flow during systole
  CV=1*(CVD*(CVS/CVD)^e);  %same as the line above
else            %this marks the end of the systole 
  e=(1-exp(-(tc-TS)/tauD))/(1-exp(-(T-TS)/tauD)); %this and the next line calculate a new based on the diastole regimen
  CV=1*(CVS*(CVD/CVS)^e);    %same as above
end    %ending the function
