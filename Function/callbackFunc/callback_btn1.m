function callback_btn1(~,~,h_fig)
% ��ͼ����ؼ�
data = guidata(h_fig);

%% ��ȡ�ؼ����
    pum = getappdata(h_fig,'pum');                  % ��ȡpopupmenu�ؼ�����
%% ���ú���
%----------- �б���б���� ------------%
    switch pum.Value
        case 1
            if ~data.NormalGraphExist
                % ��ѡ��1�������������������ͼ ������ʾ����һ������������Ϊ���ɼ�
                data.NormalGraphExist = 1;      % ��¼�ѻ�ͼ
                guidata(h_fig,data);            % ��������
                normal_graph_init
            end
        case 2
            if ~data.ObliqueGraphExist
                % ��ѡ��2��б���������������ͼ ������ʾ����һ������������Ϊ���ɼ�
                data.ObliqueGraphExist = 1;      % ��¼�ѻ�ͼ
                guidata(h_fig,data);            % ��������
                oblique_graph_init
            end
    end
%% ���÷���
end