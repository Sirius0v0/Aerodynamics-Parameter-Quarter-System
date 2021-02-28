function callback_theta(~,~,h_fig)
% 更改theta后计算相关值后返回

%% 获取控件句柄
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % 获取Ma1的相关value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % 获取Ma2的相关value
    res_beta = getappdata(h_fig,'res_beta');  % 获取beta的相关value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % 获取T2T2的相关value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % 获取rho2rho1的相关value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % 获取p2p1的相关value
    
    theta = str2double(get(edit_theta,'string'));    % 获取theta内容
    % 检查输入
    if isnan(theta)
        errordlg('错误！请检查输入的是否为数值！','错误的输入','modal')
    else

    end

%% 调用函数计算
    
%% 设置返回
    set(edit_ma1,'string',string(m1));
    set(edit_ma2,'string',string(m2));
    set(res_T2T1,'string',string(T2T1));
    set(res_p2p1,'string',string(p2p1));
    set(res_r2r1,'string',string(r2r1));
    set(res_beta,'string',strcat(string(beta),'°' ));
end