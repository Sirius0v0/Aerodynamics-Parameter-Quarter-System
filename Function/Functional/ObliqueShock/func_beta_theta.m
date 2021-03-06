function func = func_beta_theta(Ma,type)
% beta-theta关系方程(代入ma1或ma2求解)
r = 1.4;
if strcmp(type,'ma1')
    func = @(theta,beta) tand(theta) - 2*(Ma.^2.*sind(beta).^2-1)./ ( 2+(r+cosd(2*beta)).*Ma.^2 ) ./ tand(beta);
elseif strcmp(type,'ma2')
    func = @(theta,beta) (Ma.*sind(beta-theta)).^2 - ...
        (1+(r-1)/2*( ((2./((tand(beta-theta)./tand(beta)).*(r+1)-(r-1))./sind(beta).^2).^.5) .*...
        sind(beta)).^2)./(r*( ((2./((tand(beta-theta)./tand(beta)).*(r+1)-(r-1))./sind(beta).^2).^.5) .*...
        sind(beta)).^2-(r-1)/2);
end

end