function callback_ma1(~,~,h_fig)
% ����ma1��������ֵ�󷵻�

%% ��ȡ�ؼ����
    pum = getappdata(h_fig,'pum');                  % ��ȡpopupmenu�ؼ�����
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % ��ȡMa1�����value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % ��ȡMa2�����value
    res_beta = getappdata(h_fig,'res_beta');  % ��ȡbeta�����value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % ��ȡT2T2�����value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % ��ȡrho2rho1�����value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % ��ȡp2p1�����value
    
    m1 = str2double(get(edit_ma1,'string'));    % ��ȡm1����
    % �������
    if isnan(m1)
        errordlg('��������������Ƿ�Ϊ��ֵ��','���������','modal')
    else
        if (m1 < 1)
            errordlg('Ma1ӦΪ��С��1������������ʽ��','��ֵ����','modal')
            m1 = NaN;   % ��m1ΪNaN��ȡ����ʾ
        end
    end

%% ���ú�������
%----------- �б���б���� ------------%
    switch pum.Value
        case 1
            % ��ѡ��1������������������ֵ
            m2 = normalm1_m2(m1);
            r2r1 = normalm1_RD(m1);
            p2p1 = normalm1_RP(m1);
            T2T1 = normalm1_RT(m1);
            beta = 90*m1/m1;      % ������������=90degree, һ��һ��Ϊ��ʹm1=NaNʱbeta=NaN
        case 2
            % ��ѡ��2��б��������������ֵ
            
    end
    
%% ���÷���
    set(edit_ma2,'string',string(m2));
    set(res_T2T1,'string',string(T2T1));
    set(res_p2p1,'string',string(p2p1));
    set(res_r2r1,'string',string(r2r1));
    set(res_beta,'string',strcat(string(beta),'��' ));
end