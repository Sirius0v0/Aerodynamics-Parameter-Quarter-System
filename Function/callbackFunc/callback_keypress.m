function callback_keypress(evnt,h_fig)
% ���ü�����Ӧ�¼�
data = guidata(h_fig);
% disp(evnt.Key)

if (data.NormalGraphExist || data.ObliqueGraphExist)
    switch evnt.Key
        case 'hyphen'        % ���� -
            % ������ͼ�������ʾ�ľ���������� �������л�ͼƬ
            data.FigIndex = translation(data.FigIndex,'left');
            guidata(h_fig,data);
            callback_switchFig(h_fig);
        case 'equal'       % ���� =
            % ������ͼ�������ʾ�ľ���������� �������л�ͼƬ
            data.FigIndex = translation(data.FigIndex,'right');
            guidata(h_fig,data);
            callback_switchFig(h_fig);
    end

end
    
end

