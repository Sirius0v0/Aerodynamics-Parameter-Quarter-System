function [RT] = normalm2_RT(m2)
%Õý¼¤²¨ ÎÂ¶È±È RT
gamma=1.4
m1=sqrt((1+((gamma-1)/2)*m2.^2)./(gamma*m2.^2-(gamma-1)/2));
RT = (1+(2*gamma)*(m1.^2-1)/(gamma+1)).*(2+(gamma-1)*m1.^2)./((gamma+1)*m1.^2);
end