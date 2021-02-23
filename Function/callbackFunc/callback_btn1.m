function callback_btn1(~,~,h_fig)
% 绘图程序控件

%% 获取控件句柄
    pum = getappdata(h_fig,'pum');                  % 获取popupmenu控件数据
%% 调用函数
%----------- 判别正斜激波 ------------%
    switch pum.Value
        case 1
            % 当选择1（正激波）则绘制所有图 并仅显示其中一个，其他设置为不可见
            normal_graph_init
        case 2
            % 当选择2（斜激波）则
            
    end
%% 设置返回

end