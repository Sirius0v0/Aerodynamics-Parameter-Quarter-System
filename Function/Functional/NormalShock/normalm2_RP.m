function [RP] = normalRP(m2)
%Õý¼¤²¨ Ñ¹Á¦±È RP
gamma=1.4
m1=sqrt((1+((gamma-1)/2)*m2.^2)./(gamma*m2.^2-(gamma-1)/2));
RP = 1+(2*gamma)*(m1.^2-1)/(gamma+1);
end