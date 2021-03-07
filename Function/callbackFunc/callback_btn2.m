function callback_btn2(~,~,h_fig)
% 将当前显示的数据记录在内存中，等待用户保存数据
%% 获取相关数据和句柄
pum = getappdata(h_fig,'pum');                  % 获取popupmenu控件数据
btn2 = getappdata(h_fig,'btn2');
data = guidata(h_fig);
edit_ma1 = getappdata(h_fig,'edit_ma1');    % 获取Ma1的相关value
edit_ma2 = getappdata(h_fig,'edit_ma2');    % 获取Ma2的相关value
res_T2T1 = getappdata(h_fig,'res_T2T1');  % 获取T2T2的相关value
res_r2r1 = getappdata(h_fig,'res_r2r1');  % 获取rho2rho1的相关value
res_p2p1 = getappdata(h_fig,'res_p2p1');  % 获取p2p1的相关value
edit_beta = getappdata(h_fig,'edit_beta');
edit_theta = getappdata(h_fig,'edit_theta');

switch pum.Value
    case 1
        % 正激波
        m1 = str2double(get(edit_ma1,'string'));    % 获取m1内容
        m2 = str2double(get(edit_ma2,'string'));    % 获取m2内容
        beta = 90;
        t2t1 = str2double(get(res_T2T1,'string'));
        r2r1 = str2double(get(res_r2r1,'string'));
        p2p1 = str2double(get(res_p2p1,'string'));

        % 判断数据是否合法
        if isnan(m1)||isnan(m2)||isnan(beta)||isnan(t2t1)||isnan(r2r1)||isnan(p2p1)
            errordlg('无法记录数据！请检查数据是否缺漏！','记录错误','modal')
            return
        end
        
        % 改变按钮颜色 并记录数据
        set(btn2,'BackgroundColor',[192,228,117]/255)
        data.NormRecordData = [data.NormRecordData;m1, m2, beta, r2r1, p2p1, t2t1];
        pause(0.5)
        set(btn2,'BackgroundColor',[0.9400 0.9400 0.9400]);
        guidata(h_fig,data);
        
    case 2
        % 斜激波
        m1 = str2double(get(edit_ma1,'string'));    % 获取m1内容
        m2 = str2double(get(edit_ma2,'string'));    % 获取m2内容
        beta = str2double(get(edit_beta,'string'));
        theta = str2double(get(edit_theta,'string'));
        t2t1 = str2double(get(res_T2T1,'string'));
        r2r1 = str2double(get(res_r2r1,'string'));
        p2p1 = str2double(get(res_p2p1,'string'));
        
        % 判断数据是否合法
        if isnan(m1)||isnan(m2)||isnan(beta)||isnan(theta)||isnan(t2t1)||isnan(r2r1)||isnan(p2p1)
            errordlg('无法记录数据！请检查数据是否缺漏！','记录错误','modal')
            return
        end
        
        % 改变按钮颜色 并记录数据
        set(btn2,'BackgroundColor',[192,228,117]/255)
        data.ObliRecordData = [data.ObliRecordData;m1, m2, beta, r2r1, p2p1, t2t1, theta];
        pause(0.5)
        set(btn2,'BackgroundColor',[0.9400 0.9400 0.9400]);
        guidata(h_fig,data);
    
end

