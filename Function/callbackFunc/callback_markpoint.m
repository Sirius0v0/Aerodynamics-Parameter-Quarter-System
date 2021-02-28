function callback_markpoint(h_fig)
% ��Ǳ�ѡ�еĵ�
hold on
gcaa = gca;
data = guidata(h_fig);
X = data.MarkPoint(1);
Y = data.MarkPoint(2);      % ��ȡ��ѡ�еĵ�����
if isempty( getappdata(h_fig,'markH') )     % ���û������ǵ��򴴽�
    markH = plot(gca,X,Y,'b.','MarkerSize',20);
    setappdata(h_fig,'markH',markH);
else    % �����ȡ֮ǰ������������
    markH = gcaa.Children(1);
end
delete(markH) % ������һ�εĵ�
markH = plot(gca,X,Y,'b.','MarkerSize',20,'visible',1); % ������ѡ��ĵ�

hold off
end

