function callback_ma2(~,~,h_fig)
% ����ma2��������ֵ�󷵻�

%% ��ȡ�ؼ����
    pum = getappdata(h_fig,'pum');              % ��ȡpopupmenu�ؼ�����
    data = guidata(h_fig);
    bg = getappdata(h_fig,'bg');
    bg_beta = getappdata(h_fig,'bg_beta');
    edit_ma1 = getappdata(h_fig,'edit_ma1');    % ��ȡMa1�����value
    edit_ma2 = getappdata(h_fig,'edit_ma2');    % ��ȡMa2�����value
    res_beta = getappdata(h_fig,'res_beta');  % ��ȡbeta�����value
    res_T2T1 = getappdata(h_fig,'res_T2T1');  % ��ȡT2T2�����value
    res_r2r1 = getappdata(h_fig,'res_r2r1');  % ��ȡrho2rho1�����value
    res_p2p1 = getappdata(h_fig,'res_p2p1');  % ��ȡp2p1�����value
    edit_beta = getappdata(h_fig,'edit_beta');
    edit_theta = getappdata(h_fig,'edit_theta');
    
    m1 = str2double(get(edit_ma1,'string'));    % ��ȡm1����
    m2 = str2double(get(edit_ma2,'string'));    % ��ȡm2����
    beta = str2double(get(edit_beta,'string'));
    theta = str2double(get(edit_theta,'string'));
    panduan = size(get(edit_ma2,'string'));
    % �������
    if panduan(2) == 0
        return
    else
        if isnan(m2)
            errordlg('��������������Ƿ�Ϊ��ֵ��','���������','modal')
            return
        end
    end
    
    switch pum.Value
        case 1
            % ��ѡ��1������������
            if (m2 > 1)
                errordlg('Ma2ӦΪ������1������������ʽ��','��ֵ����','modal')
    %             m2 = NaN;   % ��m2ΪNaN��ȡ����ʾ
                callback_btn3([],[],h_fig);
                return
            end
            
        case 2
            % ��ѡ��б����
            if (m2 < 0.5)
                errordlg('����Ma2����ֵ�����Ƿ�����','��ֵ����','modal')
    %             m2 = NaN;   % ��m2ΪNaN��ȡ����ʾ
                callback_btn3([],[],h_fig);
                return
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
            
            % ���÷���
            set(edit_ma1,'string',string(m1));
            set(res_T2T1,'string',string(T2T1));
            set(res_p2p1,'string',string(p2p1));
            set(res_r2r1,'string',string(r2r1));
            set(res_beta,'string',string(beta));
        case 2
            % ��ѡ��2��б��������������ֵ
            [nan_num, nan_index] = howmanynan([m1, beta, theta]);
            if nan_num == 3     % ���ֻ����һ�������򷵻�
                return
            elseif nan_num == 2 % �����������������ʼ����
                switch nan_index
                    case 1  % ���beta,theta ��֪ m2, m1
                        warndlg('Ŀǰ�в�֧��Ma1��Ma2��ֵ��');
                        return;
                        [m1 , ~, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma1','ma2',[m1, m2]); 
                        data.isPreObliFig = 1;  % ��¼�Ѿ������û���ֵͼ
                        guidata(h_fig,data);
                    case 2  % ���m1, theta ��֪ m2, beta
                        warndlg('Ŀǰ�в�֧��beta��Ma2��ֵ��');
                        return;
                        % �ر�ǿ���⿪�غ�˫�⿪��
                        set(bg,'Visible','off');
                        set(bg_beta,'Visible','off');
                        [m1 , ~, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma2','beta',[m2, beta]);
                        if length(theta) == 2
                            data.Ma2beta = [m1 ; m2; beta; r2r1; p2p1; T2T1; theta];
                            set(bg_beta,'Visible','on');
                        end
                        data.isPreObliFig = 1;  % ��¼�Ѿ������û���ֵͼ
                        guidata(h_fig,data);
                    case 3  % ���m1, beta ��֪ m2, theta
                        % �ر�ǿ���⿪�غ�˫�⿪��
                        set(bg,'Visible','off');
                        set(bg_beta,'Visible','off');
                        [m1 , ~, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma2','theta',[m2, theta]); 
                        data.isPreObliFig = 1;  % ��¼�Ѿ������û���ֵͼ
                        guidata(h_fig,data);
                end
            else
                errordlg('��������������࣡�ɵ������ա��ٽ��в���','���������','modal')
                return
            end
            
            % ���÷���
            set(edit_ma1,'string',string(m1(1)));
            set(edit_theta,'string',string(theta(1)));
            set(edit_beta,'string',string(beta(1)));
            set(res_T2T1,'string',string(T2T1(1)));
            set(res_p2p1,'string',string(p2p1(1)));
            set(res_r2r1,'string',string(r2r1(1)));
    end
    
end