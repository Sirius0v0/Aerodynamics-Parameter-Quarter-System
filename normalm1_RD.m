function [RD] = normalRD(m1)
%������ �ܶȱ� Ratio of density(RD)
gamma=1.4
RD = ((gamma+1)*m1.^2)./(2+(gamma-1)*m1.^2);
end

