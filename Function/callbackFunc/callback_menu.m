function callback_menu(~,~,h_fig)
% �����û�ѡ����(б)�������н���任
% б��������theta��������˶Ըò������в���
    text_theta = getappdata(h_fig,'text_theta');    % ��ȡtheta����ؿؼ�
    edit_theta = getappdata(h_fig,'edit_theta');
    pum = getappdata(h_fig,'pum');                  % ��ȡpopupmenu�ؼ�����
    switch pum.Value
        case 1
            % ��ѡ��1��������������ʾtheta
            set(text_theta,'Visible','off');
            set(edit_theta,'Visible','off');
            callback_switchFig(h_fig);
        case 2
            % ��ѡ��2��б����������ʾtheta
            set(text_theta,'Visible','on');
            set(edit_theta,'Visible','on');
            callback_switchFig(h_fig);
    end
end