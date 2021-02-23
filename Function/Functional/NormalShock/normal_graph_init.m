%-----------默认Ma2-Ma1为初始图像-------------%
%% Ma2-Ma1
fig_ma2 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_ma2',fig_ma2);

plot(fig_ma2,1:0.01:30,normalm1_m2(1:0.01:30));
title('M2随M1变化规律');
xlabel('M1');
ylabel('M2');

%% RD-Ma1
fig_r2r1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_r2r1',fig_r2r1);

plot(fig_r2r1,1:0.01:30,normalm1_RD(1:0.01:30));
title('ρ2/ρ1随M1变化规律');
xlabel('M1');
ylabel('ρ2/ρ1');

%% RP-Ma1
fig_p2p1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_p2p1',fig_p2p1);

plot(fig_p2p1,1:0.01:30,normalm1_RP(1:0.01:30));
title('P2/P1随M1变化规律');
xlabel('M1');
ylabel('P2/P1');

%% RT-Ma1
fig_t2t1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_t2t1',fig_t2t1);

plot(fig_t2t1,1:0.01:30,normalm1_RT(1:0.01:30));
title('T2/T1随M1变化规律');
xlabel('M1');
ylabel('T2/T1');

%% 初始化可见性
callback_switchFig(h_fig)