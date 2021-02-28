function callback_buttondown(~,~,h_fig)
% ����Shift+���������ּ���ѡ��ͼ�ϵ�
%% �������
data = guidata(h_fig);
fig_point = get(gcbf,'CurrentPoint');   % �������ڴ��������е�λ��
gcaa = gca;     % ��ȡ��ǰ������в���
point = get(gcaa,'CurrentPoint');       % �������ڻ��������ϵ�λ��
switch (get(gcbf,'SelectionType'))
    case 'extend'   % Shift+���������ּ���
        if data.NormalGraphExist || data.ObliqueGraphExist
            % �������ͼ���ж�
            if (fig_point(1)<0.66 && fig_point(1)>0.06)&&(fig_point(2)<0.83 && fig_point(2)>0.08)
               % ����ͼ���С�ж�����Ƿ���ͼ����
               dist = ((point(1,1)-gcaa.Children(end).XData).^2 + (point(1,2)-gcaa.Children(end).YData).^2).^.5;  % �����������ľ���
               if min(dist) < 0.05*( min(gcaa.XLim(2)-gcaa.XLim(1), gcaa.YLim(2)-gcaa.YLim(1)) )
                   % ���������� ��
                   index = find(min(dist) == dist); % �������������
                   data.MarkPoint = [gcaa.Children(end).XData(index),gcaa.Children(end).YData(index)];
                   guidata(h_fig,data); % ����ѡ����¼��
                   callback_markpoint(h_fig);   % ���Ʊ�ǵ�
               end
            end
        end
end
end

