function callback_menu(~,~,h_fig)
% 对于用户选择正(斜)激波进行界面变换
% 斜激波多了theta参数，因此对该参数进行操作
    text_theta = getappdata(h_fig,'text_theta');    % 获取theta的相关控件
    edit_theta = getappdata(h_fig,'edit_theta');
    edit_beta = getappdata(h_fig,'edit_beta');
    res_beta = getappdata(h_fig,'res_beta');
    edit_ma1 = getappdata(h_fig,'edit_ma1');
    edit_ma2 = getappdata(h_fig,'edit_ma2');
    res_p2p1 = getappdata(h_fig,'res_p2p1');
    res_T2T1 = getappdata(h_fig,'res_T2T1');
    res_r2r1 = getappdata(h_fig,'res_r2r1');
    pum = getappdata(h_fig,'pum');                  % 获取popupmenu控件数据
    switch pum.Value
        case 1
            % 当选择1（正激波）则不显示theta,并将beta不可编辑
            set(text_theta,'Visible','off');
            set(edit_theta,'Visible','off');
            set(edit_beta,'Visible','off');
            set(res_beta,'Visible','on');
            set(edit_ma1,'string','');
            set(edit_ma2,'string','');
            set(res_p2p1,'string','');
            set(res_T2T1,'string','');
            set(res_r2r1,'string','');
            set(res_beta,'string',strcat(string(90),'°' ))
            callback_switchFig(h_fig);
        case 2
            % 当选择2（斜激波）则显示theta,并让beta可编辑
            set(text_theta,'Visible','on');
            set(edit_theta,'Visible','on');
            set(edit_beta,'Visible','on');
            set(res_beta,'Visible','off');
            set(edit_ma1,'string','');
            set(edit_ma2,'string','');
            set(res_p2p1,'string','');
            set(res_T2T1,'string','');
            set(res_r2r1,'string','');
            set(edit_theta,'string','');
            set(edit_beta,'string','');
            callback_switchFig(h_fig);
    end
end