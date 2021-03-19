function callback_motion(~,~,h_fig)
% �ı������״
%% ��ȡ����
data = guidata(h_fig);
pum = getappdata(h_fig,'pum');
gcaa = findCurrentGca(h_fig);     % ��ȡ��ǰͼ�����
point = get(gcaa,'CurrentPoint');   % ��ȡ��굱ǰ����
fig_point = get(gcbf,'CurrentPoint');   % �������ڴ��������е�λ��

%% ���������״
if ((data.NormalGraphExist||data.isPreObliFig) && (pum.Value==1) ) || ((data.ObliqueGraphExist || data.isPreObliFig) && (pum.Value==2) )
    % �������ͼ������
    if (fig_point(1)<0.66 && fig_point(1)>0.06)&&(fig_point(2)<0.83 && fig_point(2)>0.08)
               % ����ͼ���С�ж�����Ƿ���ͼ����
          if ~isempty(gcaa.Children)     
            if length(gcaa.Children) <= 2
                   % ���ݻ�ͼ��Ŀ����
                   Fin_XData = gcaa.Children(end).XData;
                   Fin_YData = gcaa.Children(end).YData;
           else
                   % ƴ������������
                   fig_temp_data = [];
                   for i = 0:5
                       temp_data = [gcaa.Children(end-i).XData;gcaa.Children(end-i).YData];
                       fig_temp_data = [fig_temp_data,temp_data];
                   end
                   Fin_XData = fig_temp_data(1,:);
                   Fin_YData = fig_temp_data(2,:);
            end

            dist = ((point(1,1)-Fin_XData).^2 + (point(1,2)-Fin_YData).^2).^.5;  % �����������ľ���
            if min(dist) < 0.05 * ( min(gcaa.XLim(2)-gcaa.XLim(1), gcaa.YLim(2)-gcaa.YLim(1)) )
                % ���������� ��
                set(gcf,'Pointer','hand') % ����Ϊ�ֵ���״
            else
                set(gcf,'Pointer','arrow') % ����Ϊ��ͷ����״
            end
          end
    end
end
end