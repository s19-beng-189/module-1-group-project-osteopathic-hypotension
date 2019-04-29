function [vl, vu] = V(QAo,t)
global Csa Rl tstand;
if t<tstand
    vl = 2.5;
    vu = 2.5;
else
    vl = QAo*Csa*Rl;
    vu = 5 - vl;
end