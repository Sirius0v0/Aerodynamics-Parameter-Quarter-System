function callback_buttondown(~,~,h_fig)
% 设置Shift+左键（或滚轮键）选择图上点
%% 获得数据
data = guidata(h_fig);
fig_point = get(gcbf,'CurrentPoint');   % 获得鼠标在窗口坐标中的位置
pum = getappdata(h_fig,'pum');
gcaa = gca;     % 获取当前坐标进行操作
point = get(gcaa,'CurrentPoint');       % 获得鼠标在画布坐标上的位置
switch (get(gcbf,'SelectionType'))
    case 'extend'   % Shift+左键（或滚轮键）
        if ((data.NormalGraphExist||data.isPreObliFig) && (pum.Value==1) ) || ((data.ObliqueGraphExist||data.isPreObliFig) && (pum.Value==2) )
            % 如果画了图再判断
            if (fig_point(1)<0.66 && fig_point(1)>0.06)&&(fig_point(2)<0.83 && fig_point(2)>0.08)
               % 根据图框大小判断鼠标是否在图框内
               
               if length(gcaa.Children) <= 2
                   % 根据画图数目构造
                   Fin_XData = gcaa.Children(end).XData;
                   Fin_YData = gcaa.Children(end).YData;
               else
                   % 拼接六条线数据
                   fig_temp_data = [];
                   for i = 0:5
                       temp_data = [gcaa.Children(end-i).XData;gcaa.Children(end-i).YData];
                       fig_temp_data = [fig_temp_data,temp_data];
                   end
                   Fin_XData = fig_temp_data(1,:);
                   Fin_YData = fig_temp_data(2,:);
               end
               
               dist = ((point(1,1)-Fin_XData).^2 + (point(1,2)-Fin_YData).^2).^.5;  % 计算与线条的距离
               if min(dist) < 0.05*( min(gcaa.XLim(2)-gcaa.XLim(1), gcaa.YLim(2)-gcaa.YLim(1)) )
                   % 当靠近线条 则
                   index = find(min(dist) == dist); % 查找最近点坐标
                   data.MarkPoint = [Fin_XData(index),Fin_YData(index)];
                   guidata(h_fig,data); % 将被选择点记录下
                   callback_markpoint(h_fig);   % 绘制标记点
                   callback_updata(h_fig);
               end
            end
        end
end
end

