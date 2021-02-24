function callback_keypress(evnt,h_fig)
% 设置键盘响应事件
data = guidata(h_fig);
% disp(evnt.Key)

if (data.NormalGraphExist || data.ObliqueGraphExist)
    switch evnt.Key
        case 'hyphen'        % 按键 -
            % 将表征图像如何显示的矩阵进行左移 以向左切换图片
            data.FigIndex = translation(data.FigIndex,'left');
            guidata(h_fig,data);
            callback_switchFig(h_fig);
        case 'equal'       % 按键 =
            % 将表征图像如何显示的矩阵进行右移 以向右切换图片
            data.FigIndex = translation(data.FigIndex,'right');
            guidata(h_fig,data);
            callback_switchFig(h_fig);
    end

end
    
end

