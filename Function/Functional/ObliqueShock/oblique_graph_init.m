%-----------默认beta-Ma1为初始图像-------------%
% 由绘图按钮btn1调用初始化，可获得句柄h_fig

legend_str = cell(1,6); % 初始化cell
i = 1;  % 循环计数
for d = [2 8 12 18 24 34]
    % 构造legend标签
    legend_str{i} = ['\delta =' num2str(d) '°'];
    i = i+1;
end
%% 导入图窗句柄
fig_obliq_beta = getappdata(h_fig,'fig_obliq_beta');
fig_obliq_ma2 = getappdata(h_fig,'fig_obliq_ma2');
fig_obliq_r2r1 = getappdata(h_fig,'fig_obliq_r2r1');
fig_obliq_p2p1 = getappdata(h_fig,'fig_obliq_p2p1');
fig_obliq_t2t1 = getappdata(h_fig,'fig_obliq_t2t1');

%% beta-Ma1
% % 创建图窗
% fig_obliq_beta = axes('Parent',h_fig,...
%                         'Units','normalized',...
%                         'Position',[0.06, 0.08, 0.6, 0.75],...
%                         'XTick',[],...
%                         'YTick',[],...
%                         'Box','On');
% setappdata(h_fig,'fig_obliq_beta',fig_obliq_beta);

% 计算数值
ax_temp = getappdata(h_fig,'ax_temp');
i = 1;
for d = [2 8 12 18 24 34]
    temp_h = fimplicit(ax_temp,func_beta(d),[1,10,5,100],'LineWidth',1,'Visible',0);    % 内置函数画图
    set(ax_temp,'Visible',0);
    data.Figdata(i).XData = [];
    data.Figdata(i).YData = [];     % 先清空再存值
    data.Figdata(i).XData = temp_h.XData;
    data.Figdata(i).YData = temp_h.YData;
    guidata(h_fig,data);        % 保存数据
    i = i + 1;
end

% % 拼接数据
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
set(fig_obliq_beta,'XScale', 'log') %x轴取对数坐标
set(fig_obliq_beta,'Xtick',1:10)
title(fig_obliq_beta,' β随Ma1变化规律 ');
ylabel(fig_obliq_beta,['\beta','/(°)']);
xlabel(fig_obliq_beta,'Ma_1');
grid(fig_obliq_beta,'on')
grid(fig_obliq_beta,'minor')
set(fig_obliq_beta,'GridLineStyle','--')
% legend(legend_str,'Location','bestoutside');

%% Ma2-Ma1
% fig_obliq_ma2 = axes('Parent',h_fig,...
%                         'Units','normalized',...
%                         'Position',[0.06, 0.08, 0.6, 0.75],...
%                         'XTick',[],...
%                         'YTick',[],...
%                         'Box','On');
% setappdata(h_fig,'fig_obliq_ma2',fig_obliq_ma2);

% 计算数值
ax_temp = getappdata(h_fig,'ax_temp');
i = 1;
for d = [2 8 12 18 24 34]
    data.Figdata(i).YData = obliquem1_m2(data.Figdata(i).XData,data.Figdata(i).YData,d);
    guidata(h_fig,data);        % 保存数据
    i = i + 1;
end

% % 拼接数据
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
% set(fig_obliq_ma2,'YScale', 'log') %x轴取对数坐标
set(fig_obliq_ma2,'Ytick',1:10)
title(fig_obliq_ma2,' Ma2随Ma1变化规律 ');
ylabel(fig_obliq_ma2,'Ma_2');
xlabel(fig_obliq_ma2,'Ma_1');
grid(fig_obliq_ma2,'on')
grid(fig_obliq_ma2,'minor')
set(fig_obliq_ma2,'GridLineStyle','--')
% legend(legend_str,'Location','bestoutside');

%% RD-Ma1
% 创建图窗
% fig_obliq_r2r1 = axes('Parent',h_fig,...
%                         'Units','normalized',...
%                         'Position',[0.06, 0.08, 0.6, 0.75],...
%                         'XTick',[],...
%                         'YTick',[],...
%                         'Box','On');
% setappdata(h_fig,'fig_obliq_r2r1',fig_obliq_r2r1);

% 计算数值
i = 1;
for d = [2 8 12 18 24 34]
    temp_h = fimplicit(ax_temp,func_r2r1(d),[1,10,1,6],'LineWidth',1,'Visible',0);  % 内置函数画图
    set(ax_temp,'Visible',0);
    data.Figdata(i).XData = [];
    data.Figdata(i).YData = [];     % 先清空再存值
    data.Figdata(i).XData = temp_h.XData;
    data.Figdata(i).YData = temp_h.YData;
    guidata(h_fig);     % 保存数据
    i = i + 1;
end

% % 拼接数据
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
grid(fig_obliq_r2r1,'on')
grid(fig_obliq_r2r1,'minor')
set(fig_obliq_r2r1,'GridLineStyle','--')
set(fig_obliq_r2r1,'XScale', 'log') %x轴取对数坐标
set(fig_obliq_r2r1,'Xtick',1:10)
title(fig_obliq_r2r1,' ρ2/ρ1随Ma1变化规律 ')
xlabel(fig_obliq_r2r1,'Ma_1')
ylabel(fig_obliq_r2r1,['\rho_2','/','\rho_1'])
% legend(legend_str,'Location','bestoutside');

%% RP-Ma1
% % 创建图窗
% fig_obliq_p2p1 = axes('Parent',h_fig,...
%                         'Units','normalized',...
%                         'Position',[0.06, 0.08, 0.6, 0.75],...
%                         'XTick',[],...
%                         'YTick',[],...
%                         'Box','On');
% setappdata(h_fig,'fig_obliq_p2p1',fig_obliq_p2p1);

% 计算数值
i = 1;
for d=[2 8 12 18 24 34]
    temp_h = fimplicit(ax_temp,func_p2p1(d),[1,10],'LineWidth',0.8,'Visible',0);       % 内置函数画图
    set(ax_temp,'Visible',0);
    data.Figdata(i).XData = [];
    data.Figdata(i).YData = [];     % 先清空再存值
    data.Figdata(i).XData = temp_h.XData;
    data.Figdata(i).YData = temp_h.YData;
    guidata(h_fig);
    i = i + 1;
end

% % 拼接数据
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
grid(fig_obliq_p2p1,'on')
grid(fig_obliq_p2p1,'minor')
title(fig_obliq_p2p1,' P2/P1随Ma1变化规律 ')
xlabel(fig_obliq_p2p1,'Ma_1')
ylabel(fig_obliq_p2p1,['p_2','/','p_1'])
set(fig_obliq_p2p1,'GridLineStyle','--')
set(fig_obliq_p2p1,'YScale', 'log') %y轴取对数坐标
set(fig_obliq_p2p1,'Ytick',1:10)
% legend(legend_str,'Location','bestoutside');

%% RT-Ma1
% 创建图窗
% fig_obliq_t2t1 = axes('Parent',h_fig,...
%                         'Units','normalized',...
%                         'Position',[0.06, 0.08, 0.6, 0.75],...
%                         'XTick',[],...
%                         'YTick',[],...
%                         'Box','On');
% setappdata(h_fig,'fig_obliq_t2t1',fig_obliq_t2t1);

i = 1;
for d=[2 8 12 18 24 34]
    temp_h = fimplicit(ax_temp,func_beta(d),[1,10,5,100],'LineWidth',1,'Visible',0);    % 内置函数画图beta,以此计算T2T1
    set(ax_temp,'Visible',0);
    data.Figdata(i).XData = [];
    data.Figdata(i).YData = [];     % 先清空再存值
    data.Figdata(i).XData = temp_h.XData;
    data.Figdata(i).YData = temp_h.YData;   
    data.Figdata(i).YData = obliquem1_RT(data.Figdata(i).XData,data.Figdata(i).YData);
    guidata(h_fig);
    i = i + 1;
end

% % 拼接数据
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
grid(fig_obliq_t2t1,'on')
grid(fig_obliq_t2t1,'minor')
set(fig_obliq_t2t1,'GridLineStyle','--')
set(fig_obliq_t2t1,'YScale', 'log') %y轴取对数坐标
set(fig_obliq_t2t1,'Xtick',1:10)
set(fig_obliq_t2t1,'Ytick',[1:10,13,17,23,30,40,53,70,90])
title(fig_obliq_t2t1,' T2/T1随Ma1变化规律 ')
xlabel(fig_obliq_t2t1,'Ma_1')
ylabel(fig_obliq_t2t1,['T_2','/','T_1'])
% legend(legend_str,'Location','bestoutside');

%% 初始化可见性
callback_switchFig(h_fig)