function [RP]= obliquem1_RP(m1,beta)
%б���� ѹǿ����m1�Ĺ�ϵʽ
%������ m��beta�ֱ𶼿���������
gamma=1.4;
mn1=m1.*sind(beta);
RP = 1+(2*gamma)*(mn1.^2-1)/(gamma+1);
end

