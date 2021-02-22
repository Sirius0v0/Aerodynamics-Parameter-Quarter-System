function [m2] = normalm1_m2(m1)
%正激波（normal shock)，输入M1求M2
%用户输入M1，可调参数gamma。
gamma=1.4;
m2=sqrt((1+((gamma-1)/2)*m1.^2)./(gamma*m1.^2-(gamma-1)/2));
end

