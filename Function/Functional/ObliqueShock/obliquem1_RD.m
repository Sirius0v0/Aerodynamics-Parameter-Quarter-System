function [RD]= obliquem1_RD(m1,beta)
%б���� �¶ȱ���m1�Ĺ�ϵʽ
%������ m��beta�ֱ𶼿���������
gamma=1.4;
mn1=m1.*sind(beta);
RD = ((gamma+1)*mn1.^2)./(2+(gamma-1)*mn1.^2);
end
