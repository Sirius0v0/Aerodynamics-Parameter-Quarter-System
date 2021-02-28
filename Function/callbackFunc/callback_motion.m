function callback_motion(~,~,h_fig)
% 改变鼠标形状
%% 获取数据
data = guidata(h_fig);
pum = getappdata(h_fig,'pum');
gcaa = gca;     % 获取当前图窗句柄
point = get(gcaa,'CurrentPoint');   % 获取鼠标当前坐标

%% 设置鼠标形状
if (data.NormalGraphExist && (pum.Value==1) ) || (data.ObliqueGraphExist && (pum.Value==2) )
    % 如果画了图则启用
    if min(((point(1,1)-gcaa.Children(end).XData).^2 + (point(1,2)-gcaa.Children(end).YData).^2).^.5) < ...
            0.05 * ( min(gcaa.XLim(2)-gcaa.XLim(1), gcaa.YLim(2)-gcaa.YLim(1)) )
        % 当靠近线条 则
        set(gcf,'Pointer','hand') % 设置为手的形状
    else
        set(gcf,'Pointer','arrow') % 设置为箭头的形状
    end
end
end

