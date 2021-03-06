function [ma1, ma2, beta, r2r1, p2p1, t2t1, theta] = getObliValue(h_fig,args1, args2)
% 斜激波相关参数求解
% 知二求四 共六种情况
% 编程时注意顺序问题

%% 获取图窗句柄
fig_obliq_beta = getappdata(h_fig,'fig_obliq_beta');
fig_obliq_ma2 = getappdata(h_fig,'fig_obliq_ma2');
fig_obliq_r2r1 = getappdata(h_fig,'fig_obliq_r2r1');
fig_obliq_p2p1 = getappdata(h_fig,'fig_obliq_p2p1');
fig_obliq_t2t1 = getappdata(h_fig,'fig_obliq_t2t1');
edit_ma1 = getappdata(h_fig,'edit_ma1');
edit_ma2 = getappdata(h_fig,'edit_ma2');
edit_theta = getappdata(h_fig,'edit_theta');
edit_beta = getappdata(h_fig,'edit_beta');
ax_temp = getappdata(h_fig,'ax_temp');
data = guidata(h_fig);


%% 编码求解
% 情况编码
if strcmp(args1, 'ma1') && strcmp(args2,'ma2')
    case_index = 1;
    ma1 = str2double(get(edit_ma1,'string'));
    ma2 = str2double(get(edit_ma2,'string'));
elseif strcmp(args1, 'ma1') && strcmp(args2,'beta')
    case_index = 2;
    ma1 = str2double(get(edit_ma1,'string'));
    beta = str2double(get(edit_beta,'string'));
elseif strcmp(args1, 'ma1') && strcmp(args2,'theta')
    case_index = 3;
    ma1 = str2double(get(edit_ma1,'string'));
    theta = str2double(get(edit_theta,'string'));
elseif strcmp(args1, 'ma2') && strcmp(args2,'beta')
    case_index = 4;
    ma2 = str2double(get(edit_ma2,'string'));
    beta = str2double(get(edit_beta,'string'));
elseif strcmp(args1, 'ma2') && strcmp(args2,'theta')
    case_index = 5;
    ma2 = str2double(get(edit_ma2,'string'));
    theta = str2double(get(edit_theta,'string'));
elseif strcmp(args1, 'beta') && strcmp(args2,'theta')
    case_index = 6;
    beta = str2double(get(edit_beta,'string'));
    theta = str2double(get(edit_theta,'string'));
end

% 内置绘图数据保存至data.Figdata
% 插值计算所有数值后保存至data.MarkedData 并返回
% data.MarkedData = ones(7,1);
% data.MarkedData
%           - Ma1
%           - Ma2
%           - beta
%           - r2r1
%           - p2p1
%           - T2T1
%           - theta
    
switch case_index
    case 1  % 知ma1 ma2
        % 内置函数画
        
        % 初始化可见性
        
         % 求值（用..）
    case 2  % 知ma1 beta
        % 内置函数画beta-theta   求解theta
        fimplicit(ax_temp,func_beta_theta(ma1,'ma1'),[0,90,0,90],'LineWidth',1,'Visible','off');
        set(ax_temp,'Visible',0);
        theta = chazhi(beta,ax_temp.Children.YData,ax_temp.Children.XData);
        
        % 内置函数画beta
        fimplicit(fig_obliq_beta,func_beta(theta),[1,10,5,100],'LineWidth',1);
        set(fig_obliq_beta,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_beta,'Xtick',1:10)
        title(fig_obliq_beta,['\beta -','Ma_1',' Figure']);
        ylabel(fig_obliq_beta,['\beta','/(°)']);
        xlabel(fig_obliq_beta,'Ma_1');
        grid(fig_obliq_beta,'on')
        grid(fig_obliq_beta,'minor')
        set(fig_obliq_beta,'GridLineStyle','--')
        
        % 画ma2-ma1
        plot(fig_obliq_ma2,fig_obliq_beta.Children.XData, obliquem1_m2(fig_obliq_beta.Children.XData,fig_obliq_beta.Children.YData,theta));
        set(fig_obliq_ma2,'Ytick',1:10)
        title(fig_obliq_ma2,['Ma_2 -','Ma_1',' Figure']);
        ylabel(fig_obliq_ma2,'Ma_2');
        xlabel(fig_obliq_ma2,'Ma_1');
        grid(fig_obliq_ma2,'on')
        grid(fig_obliq_ma2,'minor')
        set(fig_obliq_ma2,'GridLineStyle','--')
        % 内置函数画r2r1
        fimplicit(fig_obliq_r2r1,func_r2r1(theta),[1,10,1,6],'LineWidth',1);  
        grid(fig_obliq_r2r1,'on')
        grid(fig_obliq_r2r1,'minor')
        set(fig_obliq_r2r1,'GridLineStyle','--')
        set(fig_obliq_r2r1,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_r2r1,'Xtick',1:10)
        title(fig_obliq_r2r1,['\rho_2','/','\rho_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_r2r1,'Ma_1')
        ylabel(fig_obliq_r2r1,['\rho_2','/','\rho_1'])
        % 内置函数画p2p1
        fimplicit(fig_obliq_p2p1,func_p2p1(theta),[1,10],'LineWidth',0.8);
        grid(fig_obliq_p2p1,'on')
        grid(fig_obliq_p2p1,'minor')
        title(fig_obliq_p2p1,['p_2','/','p_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_p2p1,'Ma_1')
        ylabel(fig_obliq_p2p1,['p_2','/','p_1'])
        set(fig_obliq_p2p1,'GridLineStyle','--')
        set(fig_obliq_p2p1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_p2p1,'Ytick',1:10)
        % 内置函数画t2t1
        fimplicit(fig_obliq_t2t1,func_beta(theta),[1,10,5,100],'LineWidth',1);
        grid(fig_obliq_t2t1,'on')
        grid(fig_obliq_t2t1,'minor')
        set(fig_obliq_t2t1,'GridLineStyle','--')
        set(fig_obliq_t2t1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_t2t1,'Xtick',1:10)
        set(fig_obliq_t2t1,'Ytick',[1:10,13,17])
        title(fig_obliq_t2t1,['T_2','/','T_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_t2t1,'Ma_1')
        ylabel(fig_obliq_t2t1,['T_2','/','T_1'])
        
        % 初始化可见性
        callback_switchFig(h_fig,1)
        
        % 求值（用Ma1）
        ma2 = obliquem1_m2(ma1,beta,theta);
        r2r1 = obliquem1_RD(ma1,beta);
        p2p1 = obliquem1_RP(ma1,beta);
        t2t1 = obliquem1_RT(ma1,beta);
        
    case 3  % 知theta ma1
        % 内置函数画beta
        fimplicit(fig_obliq_beta,func_beta(theta),[1,10,5,100],'LineWidth',1);
        set(fig_obliq_beta,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_beta,'Xtick',1:10)
        title(fig_obliq_beta,['\beta -','Ma_1',' Figure']);
        ylabel(fig_obliq_beta,['\beta','/(°)']);
        xlabel(fig_obliq_beta,'Ma_1');
        grid(fig_obliq_beta,'on')
        grid(fig_obliq_beta,'minor')
        set(fig_obliq_beta,'GridLineStyle','--')
        % 画ma2-ma1
        plot(fig_obliq_ma2,fig_obliq_beta.Children.XData, obliquem1_m2(fig_obliq_beta.Children.XData,fig_obliq_beta.Children.YData,theta));
        set(fig_obliq_ma2,'Ytick',1:10)
        title(fig_obliq_ma2,['Ma_2 -','Ma_1',' Figure']);
        ylabel(fig_obliq_ma2,'Ma_2');
        xlabel(fig_obliq_ma2,'Ma_1');
        grid(fig_obliq_ma2,'on')
        grid(fig_obliq_ma2,'minor')
        set(fig_obliq_ma2,'GridLineStyle','--')
        % 内置函数画r2r1
        fimplicit(fig_obliq_r2r1,func_r2r1(theta),[1,10,1,6],'LineWidth',1);  
        grid(fig_obliq_r2r1,'on')
        grid(fig_obliq_r2r1,'minor')
        set(fig_obliq_r2r1,'GridLineStyle','--')
        set(fig_obliq_r2r1,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_r2r1,'Xtick',1:10)
        title(fig_obliq_r2r1,['\rho_2','/','\rho_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_r2r1,'Ma_1')
        ylabel(fig_obliq_r2r1,['\rho_2','/','\rho_1'])
        % 内置函数画p2p1
        fimplicit(fig_obliq_p2p1,func_p2p1(theta),[1,10],'LineWidth',0.8);
        grid(fig_obliq_p2p1,'on')
        grid(fig_obliq_p2p1,'minor')
        title(fig_obliq_p2p1,['p_2','/','p_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_p2p1,'Ma_1')
        ylabel(fig_obliq_p2p1,['p_2','/','p_1'])
        set(fig_obliq_p2p1,'GridLineStyle','--')
        set(fig_obliq_p2p1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_p2p1,'Ytick',1:10)
        % 内置函数画t2t1
        fimplicit(fig_obliq_t2t1,func_beta(theta),[1,10,5,100],'LineWidth',1);
        grid(fig_obliq_t2t1,'on')
        grid(fig_obliq_t2t1,'minor')
        set(fig_obliq_t2t1,'GridLineStyle','--')
        set(fig_obliq_t2t1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_t2t1,'Xtick',1:10)
        set(fig_obliq_t2t1,'Ytick',[1:10,13,17])
        title(fig_obliq_t2t1,['T_2','/','T_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_t2t1,'Ma_1')
        ylabel(fig_obliq_t2t1,['T_2','/','T_1'])
        
        % 初始化可见性
        callback_switchFig(h_fig,1)
        
        % 求值（用Ma1）
        beta = chazhi(ma1,fig_obliq_beta.Children.XData,fig_obliq_beta.Children.YData);
        ma2 = obliquem1_m2(ma1,beta,theta);
        r2r1 = obliquem1_RD(ma1,beta);
        p2p1 = obliquem1_RP(ma1,beta);
        t2t1 = obliquem1_RT(ma1,beta);
        
    case 4  % 知ma2 beta
        % 内置函数画beta-theta   求解theta
        fimplicit(ax_temp,func_beta_theta(ma2,'ma2'),[2,90,0,90],'LineWidth',1,'Visible','off');
        set(ax_temp,'Visible',0);
        theta = chazhi(beta,ax_temp.Children.YData,ax_temp.Children.XData);
        theta = filterData(theta,[0 45.5]);
        
        % 内置函数画beta
        fimplicit(fig_obliq_beta,func_beta(theta),[1,10,5,100],'LineWidth',1);
        set(fig_obliq_beta,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_beta,'Xtick',1:10)
        title(fig_obliq_beta,['\beta -','Ma_1',' Figure']);
        ylabel(fig_obliq_beta,['\beta','/(°)']);
        xlabel(fig_obliq_beta,'Ma_1');
        grid(fig_obliq_beta,'on')
        grid(fig_obliq_beta,'minor')
        set(fig_obliq_beta,'GridLineStyle','--')
        
        % 画ma2-ma1
        plot(fig_obliq_ma2,fig_obliq_beta.Children.XData, obliquem1_m2(fig_obliq_beta.Children.XData,fig_obliq_beta.Children.YData,theta));
        set(fig_obliq_ma2,'Ytick',1:10)
        title(fig_obliq_ma2,['Ma_2 -','Ma_1',' Figure']);
        ylabel(fig_obliq_ma2,'Ma_2');
        xlabel(fig_obliq_ma2,'Ma_1');
        grid(fig_obliq_ma2,'on')
        grid(fig_obliq_ma2,'minor')
        set(fig_obliq_ma2,'GridLineStyle','--')
        % 内置函数画r2r1
        fimplicit(fig_obliq_r2r1,func_r2r1(theta),[1,10,1,6],'LineWidth',1);  
        grid(fig_obliq_r2r1,'on')
        grid(fig_obliq_r2r1,'minor')
        set(fig_obliq_r2r1,'GridLineStyle','--')
        set(fig_obliq_r2r1,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_r2r1,'Xtick',1:10)
        title(fig_obliq_r2r1,['\rho_2','/','\rho_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_r2r1,'Ma_1')
        ylabel(fig_obliq_r2r1,['\rho_2','/','\rho_1'])
        % 内置函数画p2p1
        fimplicit(fig_obliq_p2p1,func_p2p1(theta),[1,10],'LineWidth',0.8);
        grid(fig_obliq_p2p1,'on')
        grid(fig_obliq_p2p1,'minor')
        title(fig_obliq_p2p1,['p_2','/','p_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_p2p1,'Ma_1')
        ylabel(fig_obliq_p2p1,['p_2','/','p_1'])
        set(fig_obliq_p2p1,'GridLineStyle','--')
        set(fig_obliq_p2p1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_p2p1,'Ytick',1:10)
        % 内置函数画t2t1
        fimplicit(fig_obliq_t2t1,func_beta(theta),[1,10,5,100],'LineWidth',1);
        grid(fig_obliq_t2t1,'on')
        grid(fig_obliq_t2t1,'minor')
        set(fig_obliq_t2t1,'GridLineStyle','--')
        set(fig_obliq_t2t1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_t2t1,'Xtick',1:10)
        set(fig_obliq_t2t1,'Ytick',[1:10,13,17])
        title(fig_obliq_t2t1,['T_2','/','T_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_t2t1,'Ma_1')
        ylabel(fig_obliq_t2t1,['T_2','/','T_1'])
        
        % 初始化可见性
        callback_switchFig(h_fig,1)
        
        % 求值（用Ma1）
            % 创建ma2-ma1序列插值
            temp_ma2 = obliquem1_m2(fig_obliq_beta.Children.XData,fig_obliq_beta.Children.YData,theta);
        ma1 = chazhi(ma2,temp_ma2,fig_obliq_beta.Children.XData);
        r2r1 = obliquem1_RD(ma1,beta);
        p2p1 = obliquem1_RP(ma1,beta);
        t2t1 = obliquem1_RT(ma1,beta);
        
    case 5  % 知ma2 theta
        % 内置函数画beta
        fimplicit(fig_obliq_beta,func_beta(theta),[1,10,5,100],'LineWidth',1);
        set(fig_obliq_beta,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_beta,'Xtick',1:10)
        title(fig_obliq_beta,['\beta -','Ma_1',' Figure']);
        ylabel(fig_obliq_beta,['\beta','/(°)']);
        xlabel(fig_obliq_beta,'Ma_1');
        grid(fig_obliq_beta,'on')
        grid(fig_obliq_beta,'minor')
        set(fig_obliq_beta,'GridLineStyle','--')
        % 画ma2-ma1
        plot(fig_obliq_ma2,fig_obliq_beta.Children.XData, obliquem1_m2(fig_obliq_beta.Children.XData,fig_obliq_beta.Children.YData,theta));
        set(fig_obliq_ma2,'Ytick',1:10)
        title(fig_obliq_ma2,['Ma_2 -','Ma_1',' Figure']);
        ylabel(fig_obliq_ma2,'Ma_2');
        xlabel(fig_obliq_ma2,'Ma_1');
        grid(fig_obliq_ma2,'on')
        grid(fig_obliq_ma2,'minor')
        set(fig_obliq_ma2,'GridLineStyle','--')
        % 内置函数画r2r1
        fimplicit(fig_obliq_r2r1,func_r2r1(theta),[1,10,1,6],'LineWidth',1);  
        grid(fig_obliq_r2r1,'on')
        grid(fig_obliq_r2r1,'minor')
        set(fig_obliq_r2r1,'GridLineStyle','--')
        set(fig_obliq_r2r1,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_r2r1,'Xtick',1:10)
        title(fig_obliq_r2r1,['\rho_2','/','\rho_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_r2r1,'Ma_1')
        ylabel(fig_obliq_r2r1,['\rho_2','/','\rho_1'])
        % 内置函数画p2p1
        fimplicit(fig_obliq_p2p1,func_p2p1(theta),[1,10],'LineWidth',0.8);
        grid(fig_obliq_p2p1,'on')
        grid(fig_obliq_p2p1,'minor')
        title(fig_obliq_p2p1,['p_2','/','p_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_p2p1,'Ma_1')
        ylabel(fig_obliq_p2p1,['p_2','/','p_1'])
        set(fig_obliq_p2p1,'GridLineStyle','--')
        set(fig_obliq_p2p1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_p2p1,'Ytick',1:10)
        % 内置函数画t2t1
        fimplicit(fig_obliq_t2t1,func_beta(theta),[1,10,5,100],'LineWidth',1);
        grid(fig_obliq_t2t1,'on')
        grid(fig_obliq_t2t1,'minor')
        set(fig_obliq_t2t1,'GridLineStyle','--')
        set(fig_obliq_t2t1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_t2t1,'Xtick',1:10)
        set(fig_obliq_t2t1,'Ytick',[1:10,13,17])
        title(fig_obliq_t2t1,['T_2','/','T_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_t2t1,'Ma_1')
        ylabel(fig_obliq_t2t1,['T_2','/','T_1'])
        
        % 初始化可见性
        callback_switchFig(h_fig,1)
        
        % 求值（用Ma2）
            % 创建ma2-ma1序列插值
            temp_ma2 = obliquem1_m2(fig_obliq_beta.Children.XData,fig_obliq_beta.Children.YData,theta);
        ma1 = chazhi(ma2,temp_ma2,fig_obliq_beta.Children.XData);
        beta = chazhi(ma1,fig_obliq_beta.Children.XData,fig_obliq_beta.Children.YData);
        if ma2 >= 1     % 通过筛选强弱解筛选beta
            beta = min(beta);
        else
            beta = max(beta);
        end
        r2r1 = obliquem1_RD(ma1,beta);
        p2p1 = obliquem1_RP(ma1,beta);
        t2t1 = obliquem1_RT(ma1,beta);
        
    case 6  % 知 beta theta
        % 内置函数画beta
        fimplicit(fig_obliq_beta,func_beta(theta),[1,10,5,100],'LineWidth',1);
        set(fig_obliq_beta,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_beta,'Xtick',1:10)
        title(fig_obliq_beta,['\beta -','Ma_1',' Figure']);
        ylabel(fig_obliq_beta,['\beta','/(°)']);
        xlabel(fig_obliq_beta,'Ma_1');
        grid(fig_obliq_beta,'on')
        grid(fig_obliq_beta,'minor')
        set(fig_obliq_beta,'GridLineStyle','--')
        % 画ma2-ma1
        plot(fig_obliq_ma2,fig_obliq_beta.Children.XData, obliquem1_m2(fig_obliq_beta.Children.XData,fig_obliq_beta.Children.YData,theta));
        set(fig_obliq_ma2,'Ytick',1:10)
        title(fig_obliq_ma2,['Ma_2 -','Ma_1',' Figure']);
        ylabel(fig_obliq_ma2,'Ma_2');
        xlabel(fig_obliq_ma2,'Ma_1');
        grid(fig_obliq_ma2,'on')
        grid(fig_obliq_ma2,'minor')
        set(fig_obliq_ma2,'GridLineStyle','--')
        % 内置函数画r2r1
        fimplicit(fig_obliq_r2r1,func_r2r1(theta),[1,10,1,6],'LineWidth',1);  
        grid(fig_obliq_r2r1,'on')
        grid(fig_obliq_r2r1,'minor')
        set(fig_obliq_r2r1,'GridLineStyle','--')
        set(fig_obliq_r2r1,'XScale', 'log') %x轴取对数坐标
        set(fig_obliq_r2r1,'Xtick',1:10)
        title(fig_obliq_r2r1,['\rho_2','/','\rho_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_r2r1,'Ma_1')
        ylabel(fig_obliq_r2r1,['\rho_2','/','\rho_1'])
        % 内置函数画p2p1
        fimplicit(fig_obliq_p2p1,func_p2p1(theta),[1,10],'LineWidth',0.8);
        grid(fig_obliq_p2p1,'on')
        grid(fig_obliq_p2p1,'minor')
        title(fig_obliq_p2p1,['p_2','/','p_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_p2p1,'Ma_1')
        ylabel(fig_obliq_p2p1,['p_2','/','p_1'])
        set(fig_obliq_p2p1,'GridLineStyle','--')
        set(fig_obliq_p2p1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_p2p1,'Ytick',1:10)
        % 内置函数画t2t1
        fimplicit(fig_obliq_t2t1,func_beta(theta),[1,10,5,100],'LineWidth',1);
        grid(fig_obliq_t2t1,'on')
        grid(fig_obliq_t2t1,'minor')
        set(fig_obliq_t2t1,'GridLineStyle','--')
        set(fig_obliq_t2t1,'YScale', 'log') %y轴取对数坐标
        set(fig_obliq_t2t1,'Xtick',1:10)
        set(fig_obliq_t2t1,'Ytick',[1:10,13,17])
        title(fig_obliq_t2t1,['T_2','/','T_1','-','Ma_1 Figure'])
        xlabel(fig_obliq_t2t1,'Ma_1')
        ylabel(fig_obliq_t2t1,['T_2','/','T_1'])
        
        % 初始化可见性
        callback_switchFig(h_fig,1)
        
        % 求值（用beta）
        ma1 = chazhi(beta,fig_obliq_beta.Children.YData,fig_obliq_beta.Children.XData);
        ma2 = obliquem1_m2(ma1,beta,theta);
        r2r1 = obliquem1_RD(ma1,beta);
        p2p1 = obliquem1_RP(ma1,beta);
        t2t1 = obliquem1_RT(ma1,beta);
        
end

end

