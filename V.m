function [vl, vu] = V(t)
global Csa QAo Rl tstand;
if t<tstand
    vl = 2.5;
    vu = 2.5;
else
    vl = QAo(t)*Csa*Rl;
    vu = 5 - vl;
end