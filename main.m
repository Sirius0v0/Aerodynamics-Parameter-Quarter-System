close all;
clear;
clc
addpath(genpath('.'));      % 添加子文件路径以查找回调函数

%% 启动设置

%% 初次登陆教程？？

%% 窗体设置
% 窗口设置
h_fig = figure('Name','空气动力学常用参数计算查询系统',...
    'MenuBar','None',...
    'NumberTitle','off',...
    'ToolBar','None',...
    'Units','normalized',...
    'Position',[0.05 0.05 0.64 0.85]);

% 静态文本底布 为了后续编辑公式显示
ax_text = axes('Parent',h_fig,...
    'Units','normalized',...
    'Position',[0, 0, 1, 1],...
    'Visible','off');
setappdata(h_fig,'ax_text',ax_text);

%% 创建菜单项
% + 编辑
%       - 保存图片
%       - 导入数据
% + 帮助
%       - 帮助
%       - 关于

% 编辑
h_menu_edit = uimenu(h_fig,'label','编辑');
h_edit_submenu1 = uimenu(h_menu_edit,'label','保存图片',...
                    'callback','');
h_edit_submenu2 = uimenu(h_menu_edit,'label','导入数据',...
                    'callback','');

% 帮助
h_menu_help = uimenu(h_fig,'label','帮助');
h_help_submenu1 = uimenu(h_menu_help,'label','帮助',...
                    'callback','');
h_help_submenu2 = uimenu(h_menu_help,'label','关于',...
                    'callback','');
                
%% 创建名称title
h_text_title = uicontrol(h_fig,'style','text',...
                'unit','normalized',...
                'position',[0.35,0.93,0.35,0.05],...
                'horizontal','center',...
                'FontName','隶书',...
                'FontSize',17,...
                'string','空气动力学常用参数计算查询系统');
                
%% 创建图窗
ax_fig = axes('Parent',h_fig,...
    'Units','normalized',...
    'Position',[0.06, 0.08, 0.6, 0.75],...
    'XTick',[],...
    'YTick',[],...
    'Box','On');
setappdata(h_fig,'ax_fig',ax_fig);

%% 创建输入栏（Ma1,Ma2,theta<根据正负激波显示或隐藏>）
% Ma1
h_text_ma1 = uicontrol(h_fig,'style','text',...
                    'unit','normalized',...
                    'position',[0.68,0.75,0.07,0.04],...
                    'horizontal','center',...
                    'FontSize',15,...
                    'string','Ma1');
h_edit_ma1 = uicontrol(h_fig,'style','edit',...
                    'unit','normalized',...
                    'position',[0.68,0.7,0.07,0.04],...
                    'horizontal','left',...
                    'FontSize',10,...
                    'string','1.35',...
                    'callback','');

% theta
h_text_theta = uicontrol(h_fig,'style','text',...
                    'Visible','off',...
                    'unit','normalized',...
                    'position',[0.76,0.75,0.07,0.04],...
                    'horizontal','center',...
                    'FontSize',15,...
                    'string','θ');
setappdata(h_fig,'text_theta',h_text_theta);
h_edit_theta = uicontrol(h_fig,'style','edit',...
                    'Visible','off',...
                    'unit','normalized',...
                    'position',[0.76,0.7,0.07,0.04],...
                    'horizontal','left',...
                    'FontSize',10,...
                    'callback','');
setappdata(h_fig,'edit_theta',h_edit_theta);

% Ma2
h_text_ma2 = uicontrol(h_fig,'style','text',...
                    'unit','normalized',...
                    'position',[0.84,0.75,0.07,0.04],...
                    'horizontal','center',...
                    'FontSize',15,...
                    'string','Ma2');
h_edit_ma2 = uicontrol(h_fig,'style','edit',...
                    'unit','normalized',...
                    'position',[0.84,0.7,0.07,0.04],...
                    'horizontal','left',...
                    'FontSize',10,...
                    'callback','');

%% 创建下拉菜单
pum = uicontrol('Style','popupmenu',...
    'Parent',h_fig,...
    'String',{'正激波','斜激波'},...
    'FontSize',10,...
    'Units','normalized',...
    'Position',[0.7, 0.65, 0.18, 0.2],...
    'Callback',{@callback_menu,h_fig});
setappdata(h_fig,'pum',pum);

%% 创建数值显示
% p2/p1
h_result_p2p1 = uicontrol(h_fig,'style','text',...
                    'unit','normalized',...
                    'position',[0.82,0.58,0.1,0.04],...
                    'horizontal','center',...
                    'FontSize',15,...
                    'string','3.1416');
text_result_p2p1 = text('unit','normalized',...
                    'position',[0.72,0.6],...
                    'horizontal','center',...
                    'Interpreter','latex',...
                    'Parent',ax_text,...
                    'FontSize',15,...
                    'string','$$\frac{p_2}{p_1}$$');

% rho2/rho1
h_result_r2r1 = uicontrol(h_fig,'style','text',...
                    'unit','normalized',...
                    'position',[0.82,0.48,0.1,0.04],...
                    'horizontal','center',...
                    'FontSize',15,...
                    'string','2.7183');
text_result_r2r1 = text('unit','normalized',...
                    'position',[0.72,0.5],...
                    'horizontal','center',...
                    'Interpreter','latex',...
                    'Parent',ax_text,...
                    'FontSize',15,...
                    'string','$$\frac{\rho_2}{\rho_1}$$');

% T2/T1
h_result_T2T1 = uicontrol(h_fig,'style','text',...
                    'unit','normalized',...
                    'position',[0.82,0.38,0.1,0.04],...
                    'horizontal','center',...
                    'FontSize',15,...
                    'string','6.626E-34');
text_result_T2T1 = text('unit','normalized',...
                    'position',[0.72,0.4],...
                    'horizontal','center',...
                    'Interpreter','latex',...
                    'Parent',ax_text,...
                    'FontSize',15,...
                    'string','$\frac{T_2}{T_1}$');

% beta
h_result_beta = uicontrol(h_fig,'style','text',...
                    'unit','normalized',...
                    'position',[0.82,0.28,0.1,0.04],...
                    'horizontal','center',...
                    'FontSize',15,...
                    'string','2.9979E8');
text_result_beta = text('unit','normalized',...
                    'position',[0.72,0.3],...
                    'horizontal','center',...
                    'Interpreter','latex',...
                    'Parent',ax_text,...
                    'FontSize',15,...
                    'string','$\beta$');
                
%% 创建按钮
btn1 = uicontrol('Style','pushbutton',...
    'Parent',h_fig,...
    'String','功能1',...
    'FontSize',13,...
    'Units','normalized',...
    'Position',[0.7,0.07,0.1,0.05],...
    'Callback',{@callback_btn1,h_fig});
setappdata(h_fig,'btn1',btn1)

btn2 = uicontrol('Style','pushbutton',...
    'Parent',h_fig,...
    'String','功能2',...
    'FontSize',13,...
    'Units','normalized',...
    'Position',[0.83,0.07,0.1,0.05],...
    'Callback',{@callback_btn2,h_fig});
setappdata(h_fig,'btn2',btn2)


%% 辅助函数
function callback_menu(~,~,h_fig)
% 对于用户选择正(斜)激波进行界面变换
% 斜激波多了theta参数，因此对该参数进行操作
    text_theta = getappdata(h_fig,'text_theta');    % 获取theta的相关控件
    edit_theta = getappdata(h_fig,'edit_theta');
    pum = getappdata(h_fig,'pum');                  % 获取popupmenu控件数据
    switch pum.Value
        case 1
            % 当选择1（正激波）则不显示theta
            set(text_theta,'Visible','off');
            set(edit_theta,'Visible','off');
        case 2
            % 当选择2（斜激波）则显示theta
            set(text_theta,'Visible','on');
            set(edit_theta,'Visible','on');
    end
end