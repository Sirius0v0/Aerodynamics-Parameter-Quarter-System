function [m2] = obliquem1_m2(m1,beta,theta)
%б����m1�ó�m2,����m1��beta(��),��theta���ȣ�
%�ɵ�����gamma (��)=1.4����������ȫ���ǽǶ�
gamma=1.4;
mn1=m1.*sind(beta);
mn2=sqrt(abs((1+(gamma-1)/2*mn1.^2)./(gamma*mn1.^2-(gamma-1)/2)));
m2=mn2./sind(beta-theta);
end

