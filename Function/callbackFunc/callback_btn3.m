function callback_btn3(~,~,h_fig)
% 清空数据区内容
%% 获取控件句柄
    pum = getappdata(h_fig,'pum');              % 获取popupmenu控件数据
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % 获取Ma1的相关value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % 获取Ma2的相关value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % 获取T2T2的相关value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % 获取rho2rho1的相关value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % 获取p2p1的相关value
    edit_beta = getappdata(h_fig,'edit_beta');
    edit_theta = getappdata(h_fig,'edit_theta');
    
    switch pum.Value
        case 1
            % 当选择1（正激波）则
            set(edit_ma1,'string','');
            set(edit_ma2,'string','');
            set(res_T2T1,'string','');
            set(res_p2p1,'string','');
            set(res_r2r1,'string','');
            
        case 2
            % 当选择2（斜激波）则
            set(edit_ma1,'string','');
            set(edit_ma2,'string','');
            set(edit_theta,'string','');
            set(edit_beta,'string','');
            set(res_T2T1,'string','');
            set(res_p2p1,'string','');
            set(res_r2r1,'string','');
end

