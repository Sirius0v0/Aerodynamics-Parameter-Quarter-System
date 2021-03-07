function callback_updata(h_fig)
% 更新界面数据为选中点
title_list = {'M2随M1变化规律','ρ2/ρ1随M1变化规律','P2/P1随M1变化规律','T2/T1随M1变化规律',...
            '\beta -Ma_1 Figure','Ma_2 -Ma_1 Figure','\rho_2/\rho_1-Ma_1 Figure','p_2/p_1-Ma_1 Figure','T_2/T_1-Ma_1 Figure'};    % 枚举所有类型的图像可能
theta_list = [2 8 12 18 24 34];
%% 获取相关句柄及要显示的数据
pum = getappdata(h_fig,'pum');
data = guidata(h_fig);
gcaa = gca;
% normal
edit_ma1 = getappdata(h_fig,'edit_ma1');    % 获取Ma1的相关value
edit_ma2 = getappdata(h_fig,'edit_ma2');    % 获取Ma2的相关value
res_beta = getappdata(h_fig,'res_beta');  % 获取beta的相关value
res_r2r1 = getappdata(h_fig,'res_r2r1');  % 获取rho2rho1的相关value
res_p2p1 = getappdata(h_fig,'res_p2p1');  % 获取p2p1的相关value
res_T2T1 = getappdata(h_fig,'res_T2T1');  % 获取T2T2的相关value
edit_theta = getappdata(h_fig,'edit_theta');    % 获取theta相关value
% oblique
fig_obliq_beta = getappdata(h_fig,'fig_obliq_beta');
fig_obliq_ma2 = getappdata(h_fig,'fig_obliq_ma2');
fig_obliq_r2r1 = getappdata(h_fig,'fig_obliq_r2r1');
fig_obliq_p2p1 = getappdata(h_fig,'fig_obliq_p2p1');
fig_obliq_t2t1 = getappdata(h_fig,'fig_obliq_t2t1');
edit_beta = getappdata(h_fig,'edit_beta');

MarkPoint = data.MarkPoint;                             % 获取已选点的坐标
PointType = get(gca,'Title').String;                    % 获取当前图窗的标题以定位
index_ax = find(ismember(title_list,PointType) == 1);      % 获取当前图窗的索引
%% 根据正（斜）激波构造相关显示数据
% data.MarkedData = ones(7,1);
% data.MarkedData
%           - Ma1
%           - Ma2
%           - beta
%           - r2r1
%           - p2p1
%           - T2T1
%           - theta
switch index_ax
    case {1,2,3,4}       % Nor_ma2 Nor_r2r1 Nor_p2p1 Nor_t2t1
        ma1 = MarkPoint(1);
        ma2 = normalm1_m2(ma1);
        beta = 90;
        r2r1 = normalm1_RD(ma1);
        p2p1 = normalm1_RP(ma1);
        t2t1 = normalm1_RT(ma1);
        theta = NaN;
        data.MarkedData = [ma1;ma2;beta;r2r1;p2p1;t2t1;theta];
    case 5  % beta
        [ma1 , ma2, beta, r2r1, p2p1, t2t1, theta] = getObliValue(h_fig,'ma1','beta',[MarkPoint(1),MarkPoint(2)],1); 
        data.MarkedData = [ma1;ma2;beta;r2r1;p2p1;t2t1;theta];
    case {6,7,8,9}  % ma2 r2r1 p2p1 t2t1
        warndlg('目前尚不支持在此图中选点查值！');
%     case {5,6,7,8,9}    % beta ma2 r2r1 p2p1 t2t1
        
%         % 判断theta的选点取值
%         theta = -1;
%         for i = 0:5
%             xdata = gcaa.Children(end-i).XData;
%             ydata = gcaa.Children(end-i).YData;
%             ind = find((xdata==MarkPoint(1))==1);
%             for item = ind
%                 if ydata(item)==MarkPoint(2)
%                     theta = theta_list(end-i);
%                     index_line = i;
%                     index_point = item;
%                     break;
%                 end
%             end
%             if theta ~= -1
%                 break;
%             end
%         end
%         disp(theta)
        
%         ma1 = MarkPoint(1);
%         ma2 = fig_obliq_ma2.Children(end-index_line).YData(index_point);
%         beta = fig_obliq_beta.Children(end-index_line).YData(index_point);
%         r2r1 = fig_obliq_r2r1.Children(end-index_line).YData(index_point);
%         p2p1 = fig_obliq_p2p1.Children(end-index_line).YData(index_point);
%         t2t1 = fig_obliq_t2t1.Children(end-index_line).YData(index_point);
%         data.MarkedData = [ma1;ma2;beta;r2r1;p2p1;t2t1;theta];
end
guidata(h_fig,data);        % 保存数据

%% 显示到界面
    set(edit_ma1,'string',string(data.MarkedData(1,end)));
    set(edit_ma2,'string',string(data.MarkedData(2,end)));
    set(res_beta,'string',string(data.MarkedData(3,end)));
    set(edit_beta,'string',string(data.MarkedData(3,end)));
    set(res_r2r1,'string',string(data.MarkedData(4,end)));
    set(res_p2p1,'string',string(data.MarkedData(5,end)));
    set(res_T2T1,'string',string(data.MarkedData(6,end)));
    set(edit_theta,'string',string(data.MarkedData(7,end)));

end

