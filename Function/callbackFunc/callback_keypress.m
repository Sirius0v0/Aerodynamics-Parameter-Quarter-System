function callback_keypress(evnt,h_fig)
% ���ü�����Ӧ�¼�
data = guidata(h_fig);
% disp(evnt.Key)

if (data.NormalGraphExist || data.ObliqueGraphExist || data.isPreObliFig)
    switch evnt.Key
        case 'hyphen'        % ���� -
            % ������ͼ�������ʾ�ľ���������� �������л�ͼƬ
            data.NormalFigIndex = translation(data.NormalFigIndex,'left');
            data.ObliqueFigIndex = translation(data.ObliqueFigIndex,'left');
            guidata(h_fig,data);
            callback_switchFig(h_fig);
        case 'equal'       % ���� =
            % ������ͼ�������ʾ�ľ���������� �������л�ͼƬ
            data.NormalFigIndex = translation(data.NormalFigIndex,'right');
            data.ObliqueFigIndex = translation(data.ObliqueFigIndex,'right');
            guidata(h_fig,data);
            callback_switchFig(h_fig);
    end

end
    
end

