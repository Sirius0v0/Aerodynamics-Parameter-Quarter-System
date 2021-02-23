function callback_ma1(~,~,h_fig)
% 更改ma1后计算相关值后返回

%% 获取控件句柄
    pum = getappdata(h_fig,'pum');                  % 获取popupmenu控件数据
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % 获取Ma1的相关value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % 获取Ma2的相关value
    res_beta = getappdata(h_fig,'res_beta');  % 获取beta的相关value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % 获取T2T2的相关value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % 获取rho2rho1的相关value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % 获取p2p1的相关value
    
    m1 = str2double(get(edit_ma1,'string'));    % 获取m1内容
    % 检查输入
    if isnan(m1)
        errordlg('错误！请检查输入的是否为数值！','错误的输入','modal')
    else
        if (m1 < 1)
            errordlg('Ma1应为不小于1的有理数或算式！','数值警告','modal')
            m1 = NaN;   % 置m1为NaN以取消显示
        end
    end

%% 调用函数计算
%----------- 判别正斜激波 ------------%
    switch pum.Value
        case 1
            % 当选择1（正激波）则计算相关值
            m2 = normalm1_m2(m1);
            r2r1 = normalm1_RD(m1);
            p2p1 = normalm1_RP(m1);
            T2T1 = normalm1_RT(m1);
            beta = 90*m1/m1;      % 正激波激波角=90degree, 一乘一除为了使m1=NaN时beta=NaN
        case 2
            % 当选择2（斜激波）则计算相关值
            
    end
    
%% 设置返回
    set(edit_ma2,'string',string(m2));
    set(res_T2T1,'string',string(T2T1));
    set(res_p2p1,'string',string(p2p1));
    set(res_r2r1,'string',string(r2r1));
    set(res_beta,'string',strcat(string(beta),'°' ));
end