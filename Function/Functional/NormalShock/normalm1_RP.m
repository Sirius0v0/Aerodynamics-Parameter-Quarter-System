function [RP] = normalRP(m1)
%������ ѹ���� Ratio of pressure(RP)
gamma=1.4;
RP = 1+(2*gamma)*(m1.^2-1)/(gamma+1);
end

