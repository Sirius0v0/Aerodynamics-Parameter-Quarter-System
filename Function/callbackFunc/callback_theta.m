function callback_theta(~,~,h_fig)
% ����theta��������ֵ�󷵻�

%% ��ȡ�ؼ����
    pum = getappdata(h_fig,'pum');              % ��ȡpopupmenu�ؼ�����
    data = guidata(h_fig);
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
    if strcmp(theta,'')
        return
    else
        if isnan(theta)
            errordlg('��������������Ƿ�Ϊ��ֵ��','���������','modal')
        else
            if (theta < 0.0001 || theta > 45.5)
                errordlg('thetaӦ������[0,45,5]�ڵ���������','��ֵ����','modal')
                theta = NaN;   % ��m1ΪNaN��ȡ����ʾ
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
            % 
        case 2
            % ��ѡ��2��б��������������ֵ
            [nan_num, nan_index] = howmanynan([m1, m2, beta]);
            if nan_num == 3     % ���ֻ����һ�������򷵻�
                return
            elseif nan_num == 2 % �����������������ʼ����
                switch nan_index
                    case 1  % ���beta,m2 ��֪ m1, theta
                        warndlg('Ŀǰ�в�֧��Ma1��theta��ֵ��');
                        return;
                        [m1 , m2, beta, r2r1, p2p1, T2T1, ~] = getObliValue(h_fig,'ma1','theta',[m1, theta]); 
                        data.isPreObliFig = 1;  % ��¼�Ѿ������û���ֵͼ
                        guidata(h_fig,data);
                    case 2  % ���m1, beta ��֪ m2, theta
                        [m1 , m2, beta, r2r1, p2p1, T2T1, ~] = getObliValue(h_fig,'ma2','theta',[m2, theta]); 
                        data.isPreObliFig = 1;  % ��¼�Ѿ������û���ֵͼ
                        guidata(h_fig,data);
                    case 3  % ���m1, m2 ��֪ beta, theta
                        [m1 , m2, beta, r2r1, p2p1, T2T1, ~] = getObliValue(h_fig,'beta','theta',[beta, theta]); 
                        data.isPreObliFig = 1;  % ��¼�Ѿ������û���ֵͼ
                        guidata(h_fig,data);
                end
            else
                errordlg('��������������࣡�ɵ������ա��ٽ��в���','���������','modal')
                return
            end
            
            % ���÷���
            set(edit_ma1,'string',string(m1));
            set(edit_ma2,'string',string(m2));
            set(edit_beta,'string',string(beta));
            set(res_T2T1,'string',string(T2T1));
            set(res_p2p1,'string',string(p2p1));
            set(res_r2r1,'string',string(r2r1));
    end
    
end