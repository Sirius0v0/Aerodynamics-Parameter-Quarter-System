function callback_markpoint(h_fig)
% 标记被选中的点
hold on
gcaa = gca;
data = guidata(h_fig);
X = data.MarkPoint(1);
Y = data.MarkPoint(2);      % 读取被选中的点坐标
if isempty( getappdata(h_fig,'markH') )     % 如果没创建标记点则创建
    markH = plot(gca,X,Y,'b.','MarkerSize',20);
    setappdata(h_fig,'markH',markH);
else    % 否则读取之前创建的坐标句柄
    markH = gcaa.Children(1);
end
delete(markH) % 隐藏上一次的点
markH = plot(gca,X,Y,'b.','MarkerSize',20,'visible',1); % 绘制新选择的点

hold off
end

