function callback_switchFig(h_fig)
% 切换已绘制的图
% 按照 ma2 --> r2r1 --> p2p1 --> T2T1 --> ma2 的循环顺序

%% 获取控件句柄
    fig_ma2 = getappdata(h_fig,'fig_ma2');
    fig_r2r1 = getappdata(h_fig,'fig_r2r1');
    fig_p2p1 = getappdata(h_fig,'fig_p2p1');
    fig_t2t1 = getappdata(h_fig,'fig_t2t1');
    data = guidata(h_fig);
    
    index = data.FigIndex;
    
%% 切换图片
    % 设置Ma2-Ma1可见性
    set(fig_ma2,'Visible',index(1))
    set(fig_ma2.Children,'Visible',index(1))
    
    % 设置r2r1-Ma1可见性
    set(fig_r2r1,'Visible',index(2))
    set(fig_r2r1.Children,'Visible',index(2))
    
    % 设置p2p1-Ma1可见性
    set(fig_p2p1,'Visible',index(3))
    set(fig_p2p1.Children,'Visible',index(3))
    
    % 设置T2T1-Ma1可见性
    set(fig_t2t1,'Visible',index(4))
    set(fig_t2t1.Children,'Visible',index(4))
end