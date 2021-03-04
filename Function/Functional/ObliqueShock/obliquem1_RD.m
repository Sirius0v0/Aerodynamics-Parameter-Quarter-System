function [RD]= obliquem1_RD(m1,beta)
%斜激波 温度比与m1的关系式
%点运算 m和beta分别都可以是向量
gamma=1.4;
mn1=m1.*sind(beta);
RD = ((gamma+1)*mn1.^2)./(2+(gamma-1)*mn1.^2);
end
