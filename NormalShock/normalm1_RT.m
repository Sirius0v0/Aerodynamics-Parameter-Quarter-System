function [RT] = normalRT(m1)
%Õý¼¤²¨ ÎÂ¶È±È Ratio of temperature(RT)
gamma=1.4
RT = (1+(2*gamma)*(m1.^2-1)/(gamma+1)).*(2+(gamma-1)*m1.^2)./((gamma+1)*m1.^2);
end

