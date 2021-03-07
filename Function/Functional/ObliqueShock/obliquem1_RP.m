function [RP]= obliquem1_RP(m1,beta)
%斜激波 压强比与m1的关系式
%点运算 m和beta分别都可以是向量
gamma=1.4;
mn1=m1.*sind(beta);
RP = 1+(2*gamma)*(mn1.^2-1)/(gamma+1);
end

