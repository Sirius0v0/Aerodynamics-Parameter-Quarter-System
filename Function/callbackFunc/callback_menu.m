function callback_menu(~,~,h_fig)
% �����û�ѡ����(б)�������н���任
% б��������theta��������˶Ըò������в���
    text_theta = getappdata(h_fig,'text_theta');    % ��ȡtheta����ؿؼ�
    edit_theta = getappdata(h_fig,'edit_theta');
    edit_beta = getappdata(h_fig,'edit_beta');
    res_beta = getappdata(h_fig,'res_beta');
    edit_ma1 = getappdata(h_fig,'edit_ma1');
    edit_ma2 = getappdata(h_fig,'edit_ma2');
    res_p2p1 = getappdata(h_fig,'res_p2p1');
    res_T2T1 = getappdata(h_fig,'res_T2T1');
    res_r2r1 = getappdata(h_fig,'res_r2r1');
    pum = getappdata(h_fig,'pum');                  % ��ȡpopupmenu�ؼ�����
    switch pum.Value
        case 1
            % ��ѡ��1��������������ʾtheta,����beta���ɱ༭
            set(text_theta,'Visible','off');
            set(edit_theta,'Visible','off');
            set(edit_beta,'Visible','off');
            set(res_beta,'Visible','on');
            set(edit_ma1,'string','');
            set(edit_ma2,'string','');
            set(res_p2p1,'string','');
            set(res_T2T1,'string','');
            set(res_r2r1,'string','');
            set(res_beta,'string',strcat(string(90),'��' ))
            callback_switchFig(h_fig);
        case 2
            % ��ѡ��2��б����������ʾtheta,����beta�ɱ༭
            set(text_theta,'Visible','on');
            set(edit_theta,'Visible','on');
            set(edit_beta,'Visible','on');
            set(res_beta,'Visible','off');
            set(edit_ma1,'string','');
            set(edit_ma2,'string','');
            set(res_p2p1,'string','');
            set(res_T2T1,'string','');
            set(res_r2r1,'string','');
            set(edit_theta,'string','');
            set(edit_beta,'string','');
            callback_switchFig(h_fig);
    end
end