function callback_buttondown(~,~,h_fig)
% ����Shift+���������ּ���ѡ��ͼ�ϵ�
%% �������
data = guidata(h_fig);
fig_point = get(gcbf,'CurrentPoint');   % �������ڴ��������е�λ��
pum = getappdata(h_fig,'pum');
gcaa = gca;     % ��ȡ��ǰ������в���
point = get(gcaa,'CurrentPoint');       % �������ڻ��������ϵ�λ��
switch (get(gcbf,'SelectionType'))
    case 'extend'   % Shift+���������ּ���
        if ((data.NormalGraphExist||data.isPreObliFig) && (pum.Value==1) ) || ((data.ObliqueGraphExist||data.isPreObliFig) && (pum.Value==2) )
            % �������ͼ���ж�
            if (fig_point(1)<0.66 && fig_point(1)>0.06)&&(fig_point(2)<0.83 && fig_point(2)>0.08)
               % ����ͼ���С�ж�����Ƿ���ͼ����
               
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
               if min(dist) < 0.05*( min(gcaa.XLim(2)-gcaa.XLim(1), gcaa.YLim(2)-gcaa.YLim(1)) )
                   % ���������� ��
                   index = find(min(dist) == dist); % �������������
                   data.MarkPoint = [Fin_XData(index),Fin_YData(index)];
                   guidata(h_fig,data); % ����ѡ����¼��
                   callback_markpoint(h_fig);   % ���Ʊ�ǵ�
                   callback_updata(h_fig);
               end
            end
        end
end
end

