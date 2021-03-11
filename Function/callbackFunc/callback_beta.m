function callback_beta(~,~,h_fig)
% 更改beta后计算相关值后返回

%% 获取控件句柄
    pum = getappdata(h_fig,'pum');              % 获取popupmenu控件数据
    data = guidata(h_fig);
    bg = getappdata(h_fig,'bg');
    bg_beta = getappdata(h_fig,'bg_beta');
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % 获取Ma1的相关value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % 获取Ma2的相关value
    edit_beta = getappdata(h_fig,'edit_beta');  % 获取beta的相关value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % 获取T2T2的相关value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % 获取rho2rho1的相关value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % 获取p2p1的相关value
    edit_theta = getappdata(h_fig,'edit_theta');
    
    m1 = str2double(get(edit_ma1,'string'));    % 获取m1内容
    m2 = str2double(get(edit_ma2,'string'));    % 获取m2内容
    beta = str2double(get(edit_beta,'string'));
    theta = str2double(get(edit_theta,'string'));
    panduan = size(get(edit_beta,'string'));
    % 检查输入
    if panduan(2) == 0
        return
    else
        if isnan(beta)
            errordlg('错误！请检查输入的是否为数值！','错误的输入','modal')
        else
            if (beta < 0.0001 || beta > 89.999)
                errordlg('beta应为[0,90]度的有理数！','数值警告','modal')
                beta = NaN;   % 置m1为NaN以取消显示
                callback_btn3([],[],h_fig);
                return
            end
        end
    end

%% 调用函数计算
%----------- 判别正斜激波 ------------%
    switch pum.Value
        case 1
            % 当选择1（正激波）则计算相关值
            
        case 2
            % 当选择2（斜激波）则计算相关值
            [nan_num, nan_index] = howmanynan([m1, m2, theta]);
            if nan_num == 3     % 如果只输入一个参数则返回
                return
            elseif nan_num == 2 % 如果输入两个参数则开始计算
                switch nan_index
                    case 1  % 求解m2,theta 已知 m1, beta
                        % 关闭强弱解开关和双解开关
                        set(bg,'Visible','off');
                        set(bg_beta,'Visible','off');
                        [m1 , m2, ~, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma1','beta',[m1, beta]); 
                        data.isPreObliFig = 1;  % 记录已经绘制用户查值图
                        guidata(h_fig,data);
                    case 2  % 求解m1, theta 已知 m2, beta
                        warndlg('目前尚不支持beta和Ma2查值！');
                        return;
                        % 关闭强弱解开关和双解开关
                        set(bg,'Visible','off');
                        set(bg_beta,'Visible','off');
                        [m1 , m2, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma2','beta',[m2, beta]); 
                        if length(theta) == 2
                            data.Ma2beta = [m1 ; m2; beta; r2r1; p2p1; T2T1; theta];
                            set(bg_beta,'Visible','on');
                        end
                        data.isPreObliFig = 1;  % 记录已经绘制用户查值图
                        guidata(h_fig,data);
                    case 3  % 求解m2, m1 已知 beta, theta
                        % 关闭强弱解开关和双解开关
                        set(bg,'Visible','off');
                        set(bg_beta,'Visible','off');
                        [m1 , m2, ~, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'beta','theta',[beta, theta]); 
                        data.isPreObliFig = 1;  % 记录已经绘制用户查值图
                        guidata(h_fig,data);
                end
            else
                errordlg('错误！输入参数过多！可点击“清空”再进行操作','额外的输入','modal')
            end
            
            % 设置返回
            set(edit_ma1,'string',string(m1(1)));
            set(edit_ma2,'string',string(m2(1)));
            set(edit_theta,'string',string(theta(1)));
            set(edit_beta,'string',string(beta(1)));
            set(res_T2T1,'string',string(T2T1(1)));
            set(res_p2p1,'string',string(p2p1(1)));
            set(res_r2r1,'string',string(r2r1(1)));
    end
end