%-----------Ĭ��beta-Ma1Ϊ��ʼͼ��-------------%
% �ɻ�ͼ��ťbtn1���ó�ʼ�����ɻ�þ��h_fig

legend_str = cell(1,6); % ��ʼ��cell
i = 1;  % ѭ������
for d = [2 8 12 18 24 34]
    % ����legend��ǩ
    legend_str{i} = ['\delta =' num2str(d) '��'];
    i = i+1;
end

%% beta-Ma1
% ����ͼ��
fig_obliq_beta = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_obliq_beta',fig_obliq_beta);

% ������ֵ
ax_temp = getappdata(h_fig,'ax_temp');
i = 1;
for d = [2 8 12 18 24 34]
    temp_h = fimplicit(ax_temp,func_beta(d),[1,10,5,100],'LineWidth',1,'Visible',0);    % ���ú�����ͼ
    set(ax_temp,'Visible',0);
    data.Figdata(i).XData = [];
    data.Figdata(i).YData = [];     % ������ٴ�ֵ
    data.Figdata(i).XData = temp_h.XData;
    data.Figdata(i).YData = temp_h.YData;
    guidata(h_fig,data);        % ��������
    i = i + 1;
end

% % ƴ������
% fig_data = [];
% for i = 1:6
%     temp_data = [data.Figdata(i).XData;data.Figdata(i).YData];
%     fig_data = [fig_data,temp_data];
% end

plot(fig_obliq_beta,data.Figdata(1).XData,data.Figdata(1).YData,...
                    data.Figdata(2).XData,data.Figdata(2).YData,...
                    data.Figdata(3).XData,data.Figdata(3).YData,...
                    data.Figdata(4).XData,data.Figdata(4).YData,...
                    data.Figdata(5).XData,data.Figdata(5).YData,...
                    data.Figdata(6).XData,data.Figdata(6).YData);
set(fig_obliq_beta,'XScale', 'log') %x��ȡ��������
set(fig_obliq_beta,'Xtick',1:10)
title(['\beta -','Ma_1',' Figure']);
ylabel(['\beta','/(��)']);
xlabel('Ma_1');
grid on;
set(fig_obliq_beta,'GridLineStyle','--')
% legend(legend_str,'Location','bestoutside');

%% Ma2-Ma1
fig_obliq_ma2 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_obliq_ma2',fig_obliq_ma2);

% ������ֵ
ax_temp = getappdata(h_fig,'ax_temp');
i = 1;
for d = [2 8 12 18 24 34]
    data.Figdata(i).YData = obliquem1_m2(data.Figdata(i).XData,data.Figdata(i).YData,d);
    guidata(h_fig,data);        % ��������
    i = i + 1;
end

% % ƴ������
% fig_data = [];
% for i = 1:6
%     temp_data = [data.Figdata(i).XData;data.Figdata(i).YData];
%     fig_data = [fig_data,temp_data];
% end

plot(fig_obliq_ma2,data.Figdata(1).XData,data.Figdata(1).YData,...
                    data.Figdata(2).XData,data.Figdata(2).YData,...
                    data.Figdata(3).XData,data.Figdata(3).YData,...
                    data.Figdata(4).XData,data.Figdata(4).YData,...
                    data.Figdata(5).XData,data.Figdata(5).YData,...
                    data.Figdata(6).XData,data.Figdata(6).YData);
set(fig_obliq_ma2,'YScale', 'log') %x��ȡ��������
set(fig_obliq_ma2,'Ytick',1:10)
title(['Ma_2 -','Ma_1',' Figure']);
ylabel('Ma_2');
xlabel('Ma_1');
grid on;
set(fig_obliq_ma2,'GridLineStyle','--')
% legend(legend_str,'Location','bestoutside');

%% RD-Ma1
% ����ͼ��
fig_obliq_r2r1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_obliq_r2r1',fig_obliq_r2r1);

% ������ֵ
i = 1;
for d = [2 8 12 18 24 34]
    temp_h = fimplicit(ax_temp,func_r2r1(d),[1,10,1,6],'LineWidth',1,'Visible',0);  % ���ú�����ͼ
    set(ax_temp,'Visible',0);
    data.Figdata(i).XData = [];
    data.Figdata(i).YData = [];     % ������ٴ�ֵ
    data.Figdata(i).XData = temp_h.XData;
    data.Figdata(i).YData = temp_h.YData;
    guidata(h_fig);     % ��������
    i = i + 1;
end

% % ƴ������
% fig_data = [];
% for i = 1:6
%     temp_data = [data.Figdata(i).XData;data.Figdata(i).YData];
%     fig_data = [fig_data,temp_data];
% end

plot(fig_obliq_r2r1,data.Figdata(1).XData,data.Figdata(1).YData,...
                    data.Figdata(2).XData,data.Figdata(2).YData,...
                    data.Figdata(3).XData,data.Figdata(3).YData,...
                    data.Figdata(4).XData,data.Figdata(4).YData,...
                    data.Figdata(5).XData,data.Figdata(5).YData,...
                    data.Figdata(6).XData,data.Figdata(6).YData);
grid on
set(fig_obliq_r2r1,'GridLineStyle','--')
set(fig_obliq_r2r1,'XScale', 'log') %x��ȡ��������
set(fig_obliq_r2r1,'Xtick',1:10)
title(['\rho_2','/','\rho_1','-','Ma_1 Figure'])
xlabel('Ma_1')
ylabel(['\rho_2','/','\rho_1'])
% legend(legend_str,'Location','bestoutside');

%% RP-Ma1
% ����ͼ��
fig_obliq_p2p1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_obliq_p2p1',fig_obliq_p2p1);

% ������ֵ
i = 1;
for d=[2 8 12 18 24 34]
    temp_h = fimplicit(ax_temp,func_p2p1(d),[1,10],'LineWidth',0.8,'Visible',0);       % ���ú�����ͼ
    set(ax_temp,'Visible',0);
    data.Figdata(i).XData = [];
    data.Figdata(i).YData = [];     % ������ٴ�ֵ
    data.Figdata(i).XData = temp_h.XData;
    data.Figdata(i).YData = temp_h.YData;
    guidata(h_fig);
    i = i + 1;
end

% % ƴ������
% fig_data = [];
% for i = 1:6
%     temp_data = [data.Figdata(i).XData;data.Figdata(i).YData];
%     fig_data = [fig_data,temp_data];
% end

plot(fig_obliq_p2p1,data.Figdata(1).XData,data.Figdata(1).YData,...
                    data.Figdata(2).XData,data.Figdata(2).YData,...
                    data.Figdata(3).XData,data.Figdata(3).YData,...
                    data.Figdata(4).XData,data.Figdata(4).YData,...
                    data.Figdata(5).XData,data.Figdata(5).YData,...
                    data.Figdata(6).XData,data.Figdata(6).YData);
grid on
title(['p_2','/','p_1','-','Ma_1 Figure'])
xlabel('Ma_1')
ylabel(['p_2','/','p_1'])
set(fig_obliq_p2p1,'GridLineStyle','--')
set(fig_obliq_p2p1,'YScale', 'log') %y��ȡ��������
set(fig_obliq_p2p1,'Ytick',1:10)
% legend(legend_str,'Location','bestoutside');

%% RT-Ma1
% ����ͼ��
fig_obliq_t2t1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_obliq_t2t1',fig_obliq_t2t1);

for d=[2 8 12 18 24 34]
    temp_h = fimplicit(ax_temp,func_p2p1(d),[1,10],'LineWidth',0.8,'Visible',0);       % ���ú�����ͼ
    set(ax_temp,'Visible',0);
    data.Figdata(i).XData = [];
    data.Figdata(i).YData = [];     % ������ٴ�ֵ
    data.Figdata(i).XData = temp_h.XData;
    data.Figdata(i).YData = temp_h.YData;
    guidata(h_fig);
    i = i + 1;
end

% % ƴ������
% fig_data = [];
% for i = 1:6
%     temp_data = [data.Figdata(i).XData;data.Figdata(i).YData];
%     fig_data = [fig_data,temp_data];
% end

plot(fig_obliq_t2t1,data.Figdata(1).XData,data.Figdata(1).YData,...
                    data.Figdata(2).XData,data.Figdata(2).YData,...
                    data.Figdata(3).XData,data.Figdata(3).YData,...
                    data.Figdata(4).XData,data.Figdata(4).YData,...
                    data.Figdata(5).XData,data.Figdata(5).YData,...
                    data.Figdata(6).XData,data.Figdata(6).YData);
grid on
set(fig_obliq_t2t1,'GridLineStyle','--')
set(fig_obliq_t2t1,'XScale', 'log') %x��ȡ��������
set(fig_obliq_t2t1,'Xtick',1:10)
title(['T_2','/','T_1','-','Ma_1 Figure'])
xlabel('Ma_1')
ylabel(['T_2','/','T_1'])
% legend(legend_str,'Location','bestoutside');

%% ��ʼ���ɼ���
callback_switchFig(h_fig)