function callback_menu(~,~,h_fig)
% 对于用户选择正(斜)激波进行界面变换
% 斜激波多了theta参数，因此对该参数进行操作
    text_theta = getappdata(h_fig,'text_theta');    % 获取theta的相关控件
    edit_theta = getappdata(h_fig,'edit_theta');
    pum = getappdata(h_fig,'pum');                  % 获取popupmenu控件数据
    switch pum.Value
        case 1
            % 当选择1（正激波）则不显示theta
            set(text_theta,'Visible','off');
            set(edit_theta,'Visible','off');
            callback_switchFig(h_fig);
        case 2
            % 当选择2（斜激波）则显示theta
            set(text_theta,'Visible','on');
            set(edit_theta,'Visible','on');
            callback_switchFig(h_fig);
    end
end