function [y0] = chashang(x0,x,y)
%3阶差商 x0插值点 x差商自变量 y差商因变量
yx1x2=(y(2)-y(1))/(x(2)-x(1));
yx2x3=(y(3)-y(2))/(x(3)-x(2));
yx1x2x3=(yx2x3-yx1x2)/(x(3)-x(1));
y0=y(1)+yx1x2*(x0-x(1))+yx1x2x3*(x0-x(1))*(x0-x(2));
end

