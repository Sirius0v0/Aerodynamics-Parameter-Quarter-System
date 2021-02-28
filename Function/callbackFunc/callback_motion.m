function callback_motion(~,~,h_fig)
% �ı������״
%% ��ȡ����
data = guidata(h_fig);
pum = getappdata(h_fig,'pum');
gcaa = gca;     % ��ȡ��ǰͼ�����
point = get(gcaa,'CurrentPoint');   % ��ȡ��굱ǰ����

%% ���������״
if (data.NormalGraphExist && (pum.Value==1) ) || (data.ObliqueGraphExist && (pum.Value==2) )
    % �������ͼ������
    if min(((point(1,1)-gcaa.Children(end).XData).^2 + (point(1,2)-gcaa.Children(end).YData).^2).^.5) < ...
            0.05 * ( min(gcaa.XLim(2)-gcaa.XLim(1), gcaa.YLim(2)-gcaa.YLim(1)) )
        % ���������� ��
        set(gcf,'Pointer','hand') % ����Ϊ�ֵ���״
    else
        set(gcf,'Pointer','arrow') % ����Ϊ��ͷ����״
    end
end
end

