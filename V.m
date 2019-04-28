function [vl, vu, vo] = V(t)
global Csa QAo rl ru;
if t<tstand
    vl = 2.5;
    vu = 2.5;
    vo = 5;
else
    vl = QAo(t)*Csa*rl;
    vu = 5 - vl;
end