function func = func_beta(d)
% beta-Ma1关系方程
r = 1.4;
func = @(Ma1,b) tand(d)-(Ma1.^2.*sind(b).^2-1)./((1+Ma1.^2.*((r+1)./2-sind(b).^2)).*tand(b));
end

