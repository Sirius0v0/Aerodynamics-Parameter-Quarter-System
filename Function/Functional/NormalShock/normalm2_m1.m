function [m1] = normalm2_m1(m2)
%������������M2��M1
gamma=1.4;
m1=sqrt((1+((gamma-1)/2)*m2.^2)./(gamma*m2.^2-(gamma-1)/2));
end