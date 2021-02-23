function array_after = translation(array,direction)
%  将数组向左或向右移位一个单位
%  @ array: 输入数组
%  @ direction: 输入移位方向
%           - 'right'<defult>: 右移（缺省值）
%           - 'left': 左移

if nargin == 1
    direction = 'right';
end

switch direction
    case 'right'
        array_after = [array(end),array(1:end-1)];
    case 'left'
        array_after = [array(2:end),array(1)];
end
end

