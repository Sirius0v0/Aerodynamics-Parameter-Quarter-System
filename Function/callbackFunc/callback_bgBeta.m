function callback_bgBeta(source,event)
% 查看斜激波Ma2Beta的双解部分
h_fig = source.Parent;
edit_ma1 = getappdata(h_fig,'edit_ma1');    % 获取Ma1的相关value
edit_ma2 = getappdata(h_fig,'edit_ma2');    % 获取Ma2的相关value
res_T2T1 = getappdata(h_fig,'res_T2T1');  % 获取T2T2的相关value
res_r2r1 = getappdata(h_fig,'res_r2r1');  % 获取rho2rho1的相关value
res_p2p1 = getappdata(h_fig,'res_p2p1');  % 获取p2p1的相关value
edit_beta = getappdata(h_fig,'edit_beta');
edit_theta = getappdata(h_fig,'edit_theta');
data = guidata(h_fig);
switch event.NewValue.String
    case ' 结果1'
        set(edit_ma1,'string',string(data.Ma2beta(1,1)))
        set(edit_ma2,'string',string(data.Ma2beta(2,1)));
        set(edit_beta,'string',string(data.Ma2beta(3,1)));
        set(res_r2r1,'string',string(data.Ma2beta(4,1)));
        set(res_p2p1,'string',string(data.Ma2beta(5,1)));
        set(res_T2T1,'string',string(data.Ma2beta(6,1)));
        set(edit_theta,'string',string(data.Ma2beta(7,1)));
        
    case ' 结果2'
        set(edit_ma1,'string',string(data.Ma2beta(1,2)))
        set(edit_ma2,'string',string(data.Ma2beta(2,2)));
        set(edit_beta,'string',string(data.Ma2beta(3,2)));
        set(res_r2r1,'string',string(data.Ma2beta(4,2)));
        set(res_p2p1,'string',string(data.Ma2beta(5,2)));
        set(res_T2T1,'string',string(data.Ma2beta(6,2)));
        set(edit_theta,'string',string(data.Ma2beta(7,2)));
end
end