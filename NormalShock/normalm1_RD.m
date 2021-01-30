function [RD] = normalRD(m1)
%Õý¼¤²¨ ÃÜ¶È±È Ratio of density(RD)
gamma=1.4
RD = ((gamma+1)*m1.^2)./(2+(gamma-1)*m1.^2);
end

