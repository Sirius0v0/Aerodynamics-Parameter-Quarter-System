function [RP] = normalRP(m1)
%Õý¼¤²¨ Ñ¹Á¦±È Ratio of pressure(RP)
gamma=1.4;
RP = 1+(2*gamma)*(m1.^2-1)/(gamma+1);
end

