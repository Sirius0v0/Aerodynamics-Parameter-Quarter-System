function callback_theta(~,~,h_fig)
% ����theta��������ֵ�󷵻�

%% ��ȡ�ؼ����
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % ��ȡMa1�����value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % ��ȡMa2�����value
    res_beta = getappdata(h_fig,'res_beta');  % ��ȡbeta�����value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % ��ȡT2T2�����value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % ��ȡrho2rho1�����value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % ��ȡp2p1�����value
    
    theta = str2double(get(edit_theta,'string'));    % ��ȡtheta����
    % �������
    if isnan(theta)
        errordlg('��������������Ƿ�Ϊ��ֵ��','���������','modal')
    else

    end

%% ���ú�������
    
%% ���÷���
    set(edit_ma1,'string',string(m1));
    set(edit_ma2,'string',string(m2));
    set(res_T2T1,'string',string(T2T1));
    set(res_p2p1,'string',string(p2p1));
    set(res_r2r1,'string',string(r2r1));
    set(res_beta,'string',strcat(string(beta),'��' ));
end