function callback_switchFig(h_fig)
% 切换已绘制的图
% 按照 (beta) --> ma2 --> r2r1 --> p2p1 --> T2T1 --> (beta) --> ma2的循环顺序

%% 获取控件句柄
    fig_ma2 = getappdata(h_fig,'fig_ma2');
    fig_r2r1 = getappdata(h_fig,'fig_r2r1');
    fig_p2p1 = getappdata(h_fig,'fig_p2p1');
    fig_t2t1 = getappdata(h_fig,'fig_t2t1');
    fig_obliq_beta = getappdata(h_fig,'fig_obliq_beta');
    fig_obliq_ma2 = getappdata(h_fig,'fig_obliq_ma2');
    fig_obliq_r2r1 = getappdata(h_fig,'fig_obliq_r2r1');
    fig_obliq_p2p1 = getappdata(h_fig,'fig_obliq_p2p1');
    fig_obliq_t2t1 = getappdata(h_fig,'fig_obliq_t2t1');
    pum = getappdata(h_fig,'pum');                  % 获取popupmenu控件数据
    data = guidata(h_fig);  % 获取data数据
    
    nor_index = data.NormalFigIndex;  % 获取当前显示图像的坐标
    obli_index = data.ObliqueFigIndex;  % 同上
    
    
%% 调用函数
%----------- 判别正斜激波 ------------%
    switch pum.Value
        case 1
            % 当选择1（正激波）则绘制所有图 并仅显示其中一个，其他设置为不可见
            
%             % 设置Ma2-Ma1可见性
%             set(fig_ma2,'Visible',index(1))
%             set(fig_ma2.Children,'Visible',index(1))
% 
%             % 设置r2r1-Ma1可见性
%             set(fig_r2r1,'Visible',index(2))
%             set(fig_r2r1.Children,'Visible',index(2))
% 
%             % 设置p2p1-Ma1可见性
%             set(fig_p2p1,'Visible',index(3))
%             set(fig_p2p1.Children,'Visible',index(3))
% 
%             % 设置T2T1-Ma1可见性
%             set(fig_t2t1,'Visible',index(4))
%             set(fig_t2t1.Children,'Visible',index(4))
              if data.ObliqueGraphExist
                  % 如果存在斜激波的图 则全部隐藏
                  set(eval(data.FigHandleName{find(obli_index == 1)+4}), 'visible',0 );     % 隐藏axis
                  set(eval(data.FigHandleName{find(obli_index == 1)+4}).Children, 'visible',0 );    % 隐藏线条
                  set(eval(data.FigHandleName{find(obli_index == 1)+4}).Legend, 'visible',0 );      % 隐藏图例
              end
              
              if data.NormalGraphExist
                  for jj = 1:4
                      % 替代上述注释内容
                      set(eval(data.FigHandleName{jj}), 'visible',nor_index(jj) );
                      set(eval(data.FigHandleName{jj}).Children, 'visible',nor_index(jj) );
                  end
              end
              
        case 2
            % 当选择2（斜激波）则绘制所有图 并仅显示其中一个，其他设置为不可见
            
%             % 设置beta-Ma1可见性
%             set(fig_obliq_beta,'Visible',index(1))
%             set(fig_obliq_beta.Children,'Visible',index(1))
% 
%             % 设置r2r1-Ma1可见性
%             set(fig_obliq_r2r1,'Visible',index(2))
%             set(fig_obliq_r2r1.Children,'Visible',index(2))
% 
%             % 设置p2p1-Ma1可见性
%             set(fig_obliq_p2p1,'Visible',index(3))
%             set(fig_obliq_p2p1.Children,'Visible',index(3))
% 
%             % 设置T2T1-Ma1可见性
%             set(fig_obliq_t2t1,'Visible',index(4))
%             set(fig_obliq_t2t1.Children,'Visible',index(4))

              if data.NormalGraphExist
                  % 如果存在正激波的图 则全部隐藏
                  set(eval(data.FigHandleName{nor_index == 1}), 'visible',0 );
                  set(eval(data.FigHandleName{nor_index == 1}).Children, 'visible',0 );
              end
              
              if data.ObliqueGraphExist
                  for jj = 1:5
                      % 替代上述注释内容
                      set(eval(data.FigHandleName{jj+4}), 'visible',obli_index(jj) );
                      set(eval(data.FigHandleName{jj+4}).Children, 'visible',obli_index(jj) );
                      set(eval(data.FigHandleName{jj+4}).Legend, 'visible',obli_index(jj) );
                  end
              end
    end

end