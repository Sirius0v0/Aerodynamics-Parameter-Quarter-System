function [m2] = normalm1_m2(m1)
%��������normal shock)������M1��M2
%�û�����M1���ɵ�����gamma��
gamma=1.4;
m2=sqrt((1+((gamma-1)/2)*m1.^2)./(gamma*m1.^2-(gamma-1)/2));
end

