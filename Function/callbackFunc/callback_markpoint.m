function callback_markpoint(h_fig)
% ��Ǳ�ѡ�еĵ�
hold on
gcaa = gca;
data = guidata(h_fig);
X = data.MarkPoint(1);
Y = data.MarkPoint(2);      % ��ȡ��ѡ�еĵ�����
if isempty( findobj('tag','MarkPoint') )     % ���û������ǵ��򴴽�
    plot(gca,X,Y,'b.','MarkerSize',20,'tag','MarkPoint');
    % setappdata(h_fig,'markH',markH);
else    % �����ȡ֮ǰ������������
    markH = findobj('tag','MarkPoint');
    delete(markH) % ������һ�εĵ�
    plot(gca,X,Y,'b.','MarkerSize',20,'visible',1,'tag','MarkPoint'); % ������ѡ��ĵ�
end

hold off
end

