function [RD] = normalm2_RD(m2)
%Õý¼¤²¨ ÃÜ¶È±È RD
gamma=1.4
m1=sqrt((1+((gamma-1)/2)*m2.^2)./(gamma*m2.^2-(gamma-1)/2));
RD = ((gamma+1)*m1.^2)./(2+(gamma-1)*m1.^2);
end