function [vl, vu] = V(t)
global Csa QAo rl;
if t<tstand
    vl = 2.5;
    vu = 2.5;
else
    vl = QAo(t)*Csa*rl;
    vu = 5 - vl;
end