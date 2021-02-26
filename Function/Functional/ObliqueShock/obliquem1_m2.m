function [m2] = obliquem1_m2(m1,beta,theta)
%斜激波m1得出m2,输入m1、beta(β),、theta（θ）
%可调参数gamma (γ)=1.4，本函数里全部是角度
gamma=1.4;
mn1=m1.*sind(beta);
mn2=sqrt(abs((1+(gamma-1)/2*mn1.^2)./(gamma*mn1.^2-(gamma-1)/2)));
m2=mn2./sind(beta-theta);
end

