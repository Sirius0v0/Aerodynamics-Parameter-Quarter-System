function callback_markpoint(h_fig)
% 标记被选中的点
hold on
gcaa = gca;
data = guidata(h_fig);
X = data.MarkPoint(1);
Y = data.MarkPoint(2);      % 读取被选中的点坐标
if isempty( findobj('tag','MarkPoint') )     % 如果没创建标记点则创建
    plot(gca,X,Y,'b.','MarkerSize',20,'tag','MarkPoint');
    % setappdata(h_fig,'markH',markH);
else    % 否则读取之前创建的坐标句柄
    markH = findobj('tag','MarkPoint');
    delete(markH) % 隐藏上一次的点
    plot(gca,X,Y,'b.','MarkerSize',20,'visible',1,'tag','MarkPoint'); % 绘制新选择的点
end

hold off
end

