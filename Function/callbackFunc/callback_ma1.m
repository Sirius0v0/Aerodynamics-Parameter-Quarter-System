function callback_ma1(~,~,h_fig)
% 更改ma1后计算相关值后返回

%% 获取控件句柄
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % 获取Ma1的相关value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % 获取Ma2的相关value
    res_beta = getappdata(h_fig,'res_beta');  % 获取beta的相关value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % 获取T2T2的相关value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % 获取rho2rho1的相关value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % 获取p2p1的相关value
    
    m1 = get(edit_ma1,'string');
    m1 = eval(m1);
%% 调用函数
    m2 = normalm1_m2(m1);
    r2r1 = normalm1_RD(m1);
    p2p1 = normalm1_RP(m1);
    T2T1 = normalm1_RT(m1);
    
%% 设置返回
    set(edit_ma2,'string',string(m2));
    set(res_T2T1,'string',string(T2T1));
    set(res_p2p1,'string',string(p2p1));
    set(res_r2r1,'string',string(r2r1));
end

