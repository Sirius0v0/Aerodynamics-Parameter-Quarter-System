function callback_ma2(~,~,h_fig)
% 更改ma2后计算相关值后返回

%% 获取控件句柄
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % 获取Ma1的相关value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % 获取Ma2的相关value
    res_beta = getappdata(h_fig,'res_beta');  % 获取beta的相关value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % 获取T2T2的相关value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % 获取rho2rho1的相关value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % 获取p2p1的相关value
    
    m2 = get(edit_ma2,'string');
    try
        m2 = eval(m2);
    catch
        m2 = NaN;
        errordlg('错误！请检查输入！Ma2应为小于1的有理数或算式。','错误警告','on')
    end
    
%% 调用函数
    m1 = normalm2_m1(m2);
    r2r1 = normalm2_RD(m2);
    p2p1 = normalm2_RP(m2);
    T2T1 = normalm2_RT(m2);
    
%% 设置返回
    set(edit_ma1,'string',string(m1));
    set(res_T2T1,'string',string(T2T1));
    set(res_p2p1,'string',string(p2p1));
    set(res_r2r1,'string',string(r2r1));
end