function callback_ma2(~,~,h_fig)
% ����ma2��������ֵ�󷵻�

%% ��ȡ�ؼ����
    pum = getappdata(h_fig,'pum');              % ��ȡpopupmenu�ؼ�����
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % ��ȡMa1�����value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % ��ȡMa2�����value
    res_beta = getappdata(h_fig,'res_beta');  % ��ȡbeta�����value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % ��ȡT2T2�����value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % ��ȡrho2rho1�����value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % ��ȡp2p1�����value
    
    m2 = str2double(get(edit_ma2,'string'));    % ��ȡm1����
    % �������
    if isnan(m2)
        errordlg('��������������Ƿ�Ϊ��ֵ��','���������','modal')
    else
        if (m2 > 1)
            errordlg('Ma2ӦΪ������1������������ʽ��','��ֵ����','modal')
            m2 = NaN;   % ��m2ΪNaN��ȡ����ʾ
        end
    end
    
%% ���ú�������
%----------- �б���б���� ------------%
    switch pum.Value
        case 1
            % ��ѡ��1������������������ֵ
            m1 = normalm2_m1(m2);
            r2r1 = normalm2_RD(m2);
            p2p1 = normalm2_RP(m2);
            T2T1 = normalm2_RT(m2);
            beta = 90*m2/m2;      % ������������=90degree, һ��һ��Ϊ��ʹm2=NaNʱbeta=NaN
        case 2
            % ��ѡ��2��б��������������ֵ
            
    end
    
%% ���÷���
    set(edit_ma1,'string',string(m1));
    set(res_T2T1,'string',string(T2T1));
    set(res_p2p1,'string',string(p2p1));
    set(res_r2r1,'string',string(r2r1));
    set(res_beta,'string',strcat(string(beta),'��' ));
end