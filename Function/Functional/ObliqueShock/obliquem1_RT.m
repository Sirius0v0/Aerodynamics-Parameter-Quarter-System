function [RT]= obliquem1_RT(m1,beta)
%б���� �¶ȱ���m1�Ĺ�ϵʽ
%������ m��beta�ֱ𶼿���������
gamma=1.4;
mn1=m1.*sind(beta);
RT=(1+(2*gamma)*(mn1.^2-1)/(gamma+1)).*(2+(gamma-1)*mn1.^2)./((gamma+1)*mn1.^2);
end

