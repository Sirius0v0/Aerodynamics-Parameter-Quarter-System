function main()
    close all
    
    h_fig = figure('Name','窗口名字',...
        'MenuBar','None',...
        'ToolBar','None',...
        'Units','normalized',...
        'Position',[0.05 0.05 0.7 0.9]);
    
    ax_fig = axes('Parent',h_fig,...
        'Units','normalized',...
        'Position',[0.06, 0.08, 0.7, 0.85],...
        'XTick',[],...
        'YTick',[],...
        'Box','On');
    setappdata(h_fig,'ax_fig',ax_fig);
    
    pum = uicontrol('Style','popupmenu',...
        'Parent',h_fig,...
        'String',{'请选择','1','2'},...
        'FontSize',10,...
        'Units','normalized',...
        'Position',[0.78, 0.45, 0.18, 0.2]);
    setappdata(h_fig,'pum',pum);
    
    btn1 = uicontrol('Style','pushbutton',...
        'Parent',h_fig,...
        'String','功能1',...
        'FontSize',14,...
        'Units','normalized',...
        'Position',[0.78,0.4,0.18,0.1],...
        'Callback',{@callback_btn1,h_fig});
    setappdata(h_fig,'btn1',btn1)
    
    btn2 = uicontrol('Style','pushbutton',...
        'Parent',h_fig,...
        'String','功能2',...
        'FontSize',14,...
        'Units','normalized',...
        'Position',[0.78,0.1,0.18,0.1],...
        'Callback',{@callback_btn2,h_fig});
    setappdata(h_fig,'btn2',btn2)
    
    btn3 = uicontrol('Style','pushbutton',...
        'Parent',h_fig,...
        'String','功能3',...
        'FontSize',14,...
        'Units','normalized',...
        'Position',[0.78,0.25,0.18,0.1],...
        'Callback',{@callback_btn3,h_fig});
    setappdata(h_fig,'btn3',btn3)
end

function callback_btn3(~,~,h_fig)
    ax_fig = getappdata(h_fig,'ax_fig');
   
end

function callback_btn2(~,~,h_fig)
    ax_fig = getappdata(h_fig,'ax_fig');

end

function callback_btn1(~,~,h_fig)
    ax_fig = getappdata(h_fig,'ax_fig');

end


%% 自定义辅助性函数
%以下为示例函数

function [dy,dx] = diff_ctr(y,Dt,n)
%   数值微分函数
%   y = 待微分的数据； Dt 步长 ，一般取值0.05，n为求微分阶数
y1 = [y 0 0 0 0 0 0];
y2 = [0 y 0 0 0 0 0];
y3 = [0 0 y 0 0 0 0];
y4 = [0 0 0 y 0 0 0];
y5 = [0 0 0 0 y 0 0];
y6 = [0 0 0 0 0 y 0];
y7 = [0 0 0 0 0 0 y];

switch n
    case 1, dy = (-y1 + 8*y2 - 8*y4 + y5)/12/Dt;
    case 2, dy = (-y1 + 16*y2 - 30*y3 + 16*y4 - y5)/12/Dt^2;
    case 3, dy = (-y1 + 8*y2 - 13*y3 + 13*y5 - 8*y6 +y7)/8/Dt^3;
    case 4, dy = (-y1 + 12*y2 -39*y3 +56*y4-39*y5+12*y6-y7)/6/Dt^4;
end
dy = dy(5+2*(n>2):end-4-2*(n>2));
dx = ([2:length(dy)+1]+(n>2))*Dt;
end