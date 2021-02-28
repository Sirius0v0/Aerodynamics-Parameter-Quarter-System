function callback_btn1(~,~,h_fig)
% 绘图程序控件
data = guidata(h_fig);

%% 获取控件句柄
    pum = getappdata(h_fig,'pum');                  % 获取popupmenu控件数据
%% 调用函数
%----------- 判别正斜激波 ------------%
    switch pum.Value
        case 1
            if ~data.NormalGraphExist
                % 当选择1（正激波）则绘制所有图 并仅显示其中一个，其他设置为不可见
                data.NormalGraphExist = 1;      % 记录已画图
                guidata(h_fig,data);            % 保存数据
                normal_graph_init
            end
        case 2
            if ~data.ObliqueGraphExist
                % 当选择2（斜激波）则绘制所有图 并仅显示其中一个，其他设置为不可见
                data.ObliqueGraphExist = 1;      % 记录已画图
                guidata(h_fig,data);            % 保存数据
                oblique_graph_init
            end
    end
%% 设置返回
end