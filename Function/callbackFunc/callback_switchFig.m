function callback_switchFig(h_fig)
% �л��ѻ��Ƶ�ͼ
% ���� ma2 --> r2r1 --> p2p1 --> T2T1 --> ma2 ��ѭ��˳��

%% ��ȡ�ؼ����
    fig_ma2 = getappdata(h_fig,'fig_ma2');
    fig_r2r1 = getappdata(h_fig,'fig_r2r1');
    fig_p2p1 = getappdata(h_fig,'fig_p2p1');
    fig_t2t1 = getappdata(h_fig,'fig_t2t1');
    fig_obliq_beta = getappdata(h_fig,'fig_obliq_beta');
    fig_obliq_r2r1 = getappdata(h_fig,'fig_obliq_r2r1');
    fig_obliq_p2p1 = getappdata(h_fig,'fig_obliq_p2p1');
    fig_obliq_t2t1 = getappdata(h_fig,'fig_obliq_t2t1');
    pum = getappdata(h_fig,'pum');                  % ��ȡpopupmenu�ؼ�����
    data = guidata(h_fig);
    
    index = data.FigIndex;
    
    
%% ���ú���
%----------- �б���б���� ------------%
    switch pum.Value
        case 1
            % ��ѡ��1�������������������ͼ ������ʾ����һ������������Ϊ���ɼ�
            
%             % ����Ma2-Ma1�ɼ���
%             set(fig_ma2,'Visible',index(1))
%             set(fig_ma2.Children,'Visible',index(1))
% 
%             % ����r2r1-Ma1�ɼ���
%             set(fig_r2r1,'Visible',index(2))
%             set(fig_r2r1.Children,'Visible',index(2))
% 
%             % ����p2p1-Ma1�ɼ���
%             set(fig_p2p1,'Visible',index(3))
%             set(fig_p2p1.Children,'Visible',index(3))
% 
%             % ����T2T1-Ma1�ɼ���
%             set(fig_t2t1,'Visible',index(4))
%             set(fig_t2t1.Children,'Visible',index(4))
              if data.ObliqueGraphExist
                  % �������б������ͼ ��ȫ������
                  set(eval(data.FigHandleName{find(index == 1)+4}), 'visible',0 );
                  set(eval(data.FigHandleName{find(index == 1)+4}).Children, 'visible',0 );
                  set(eval(data.FigHandleName{find(index == 1)+4}).Legend, 'visible',0 );
              end
              
              if data.NormalGraphExist
                  for jj = 1:4
                      % �������ע������
                      set(eval(data.FigHandleName{jj}), 'visible',index(jj) );
                      set(eval(data.FigHandleName{jj}).Children, 'visible',index(jj) );
                  end
              end
              
        case 2
            % ��ѡ��2��б���������������ͼ ������ʾ����һ������������Ϊ���ɼ�
            
%             % ����beta-Ma1�ɼ���
%             set(fig_obliq_beta,'Visible',index(1))
%             set(fig_obliq_beta.Children,'Visible',index(1))
% 
%             % ����r2r1-Ma1�ɼ���
%             set(fig_obliq_r2r1,'Visible',index(2))
%             set(fig_obliq_r2r1.Children,'Visible',index(2))
% 
%             % ����p2p1-Ma1�ɼ���
%             set(fig_obliq_p2p1,'Visible',index(3))
%             set(fig_obliq_p2p1.Children,'Visible',index(3))
% 
%             % ����T2T1-Ma1�ɼ���
%             set(fig_obliq_t2t1,'Visible',index(4))
%             set(fig_obliq_t2t1.Children,'Visible',index(4))

              if data.NormalGraphExist
                  % ���������������ͼ ��ȫ������
                  set(eval(data.FigHandleName{find(index == 1)}), 'visible',0 );
                  set(eval(data.FigHandleName{find(index == 1)}).Children, 'visible',0 );
              end
              
              if data.ObliqueGraphExist
                  for jj = 1:4
                      % �������ע������
                      set(eval(data.FigHandleName{jj+4}), 'visible',index(jj) );
                      set(eval(data.FigHandleName{jj+4}).Children, 'visible',index(jj) );
                      set(eval(data.FigHandleName{jj+4}).Legend, 'visible',index(jj) );
                  end
              end
    end

end