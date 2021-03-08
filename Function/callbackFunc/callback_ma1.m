function callback_ma1(~,~,h_fig)
% ����ma1��������ֵ�󷵻�

%% ��ȡ�ؼ����
    pum = getappdata(h_fig,'pum');                  % ��ȡpopupmenu�ؼ�����
    data = guidata(h_fig);
    bg = getappdata(h_fig,'bg');
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
    % �������
    if strcmp(m1,'')
        return
    else
        if isnan(m1)
            errordlg('��������������Ƿ�Ϊ��ֵ��','���������','modal')
            return
        else
            if (m1 < 1)
                errordlg('Ma1ӦΪ��С��1������������ʽ��','��ֵ����','modal')
                m1 = NaN;   % ��m1ΪNaN��ȡ����ʾ
                callback_btn3([],[],h_fig);
                return
            end
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
            
           % ���÷���
            set(edit_ma2,'string',string(m2));
            set(res_T2T1,'string',string(T2T1));
            set(res_p2p1,'string',string(p2p1));
            set(res_r2r1,'string',string(r2r1));
            set(res_beta,'string',string(beta));
        case 2
            % ��ѡ��2��б��������������ֵ
            [nan_num, nan_index] = howmanynan([m2, beta, theta]);
            if nan_num == 3     % ���ֻ����һ�������򷵻�
                return
            elseif nan_num == 2 % �����������������ʼ����
                switch nan_index
                    case 1  % ���beta,theta ��֪ m1, m2
                        warndlg('Ŀǰ�в�֧��Ma1��Ma2��ֵ��');
                        return;
                        [~ , m2, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma1','ma2',[m1, m2]); 
                        data.isPreObliFig = 1;  % ��¼�Ѿ������û���ֵͼ
                        guidata(h_fig,data);
                    case 2  % ���m2, theta ��֪ m1, beta
                        % �ر�ǿ���⿪��
                        set(bg,'Visible','off');
                        [~ , m2, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma1','beta',[m1, beta]); 
                        data.isPreObliFig = 1;  % ��¼�Ѿ������û���ֵͼ
                        guidata(h_fig,data);
                    case 3  % ���m2, beta ��֪ m1, theta
%                         warndlg('Ŀǰ�в�֧��Ma1��theta��ֵ��');
%                         return;
                        [~ , m2, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma1','theta',[m1, theta]); 
                        % ����ǿ���⿪��
                        set(bg,'Visible','on');
                        data.ObliQiang = [[m1,m1] ; m2; beta; r2r1; p2p1; T2T1; [theta,theta]];
                        data.isPreObliFig = 1;  % ��¼�Ѿ������û���ֵͼ
                        guidata(h_fig,data);
                end
            else
                errordlg('��������������࣡�ɵ������ա��ٽ��в���','���������','modal')
                return
            end
            
            % ���÷���
            set(edit_ma2,'string',string(m2(1)));
            set(edit_theta,'string',string(theta(1)));
            set(edit_beta,'string',string(beta(1)));
            set(res_T2T1,'string',string(T2T1(1)));
            set(res_p2p1,'string',string(p2p1(1)));
            set(res_r2r1,'string',string(r2r1(1)));
    end
    
end