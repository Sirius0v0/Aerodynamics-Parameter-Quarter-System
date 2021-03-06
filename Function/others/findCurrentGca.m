function obj = findCurrentGca(h_fig)
% 查找当前显示的图窗句柄
title_list = {'fig_ma2','fig_r2r1','fig_p2p1','fig_t2t1',...
            'fig_obliq_beta','fig_obliq_ma2','fig_obliq_r2r1','fig_obliq_p2p1','fig_obliq_t2t1'};    % 枚举所有类型的图像可能
data = guidata(h_fig);      % 获取data
pum = getappdata(h_fig,'pum');

switch pum.Value
    case 1
        % 正激波
        index = data.NormalFigIndex == 1;
        obj = getappdata(h_fig,title_list{index});
    case 2
        % 斜激波
        index = find(data.ObliqueFigIndex == 1);
        obj = getappdata(h_fig,title_list{index+4}); 
end

end

