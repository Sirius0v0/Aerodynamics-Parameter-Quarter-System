function initNormFig(h_fig)
% 初始化正激波图窗
%% Ma2-Ma1
fig_ma2 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'tag','Nor_ma2',...
                        'Visible','off',...
                        'Box','On');
setappdata(h_fig,'fig_ma2',fig_ma2);

%% RD-Ma1
fig_r2r1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'tag','Nor_r2r1',...
                        'Visible','off',...
                        'Box','On');
setappdata(h_fig,'fig_r2r1',fig_r2r1);

%% RP-Ma1
fig_p2p1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'tag','Nor_p2p1',...
                        'Visible','off',...
                        'Box','On');
setappdata(h_fig,'fig_p2p1',fig_p2p1);

%% RT-Ma1
fig_t2t1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'tag','Nor_t2t1',...
                        'Visible','off',...
                        'Box','On');
setappdata(h_fig,'fig_t2t1',fig_t2t1);

end

