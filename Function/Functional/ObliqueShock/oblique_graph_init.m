%-----------默认beta-Ma1为初始图像-------------%
% 由绘图按钮btn1调用初始化，可获得句柄h_fig
%% beta-Ma1
fig_obliq_beta = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_obliq_beta',fig_obliq_beta);

% syms Ma1 b
r = 1.4;
i = 1;
for d = [2 8 12 18 24 36]
    S =@(Ma1,b) tand(d)-(Ma1.^2.*sind(b).^2-1)./((1+Ma1.^2.*((r+1)./2-sind(b).^2)).*tand(b));
    fimplicit(fig_obliq_beta,S,[1,10,5,100],'LineWidth',1);
    legend_str{i} = ['\delta =' num2str(d) '°'];
    i = i+1;
    hold on;
end
hold off;
set(fig_obliq_beta,'XScale', 'log') %x轴取对数坐标
set(fig_obliq_beta,'Xtick',1:10)
title(['\beta -','Ma_1',' Figure']);
ylabel(['\beta','/(°)']);
xlabel('Ma_1');
grid on;
set(fig_obliq_beta,'GridLineStyle','--')
legend(legend_str,'Location','bestoutside');

%% Ma2-Ma1
% fig_obliq_ma2 = axes('Parent',h_fig,...
%                         'Units','normalized',...
%                         'Position',[0.06, 0.08, 0.6, 0.75],...
%                         'XTick',[],...
%                         'YTick',[],...
%                         'Box','On');
% setappdata(h_fig,'fig_obliq_ma2',fig_obliq_ma2);
% 
% % plot(fig_obliq_ma2,1:0.01:30,normalm1_m2(1:0.01:30));
% title('M2随M1变化规律');
% xlabel('M1');
% ylabel('M2');

%% RD-Ma1
fig_obliq_r2r1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_obliq_r2r1',fig_obliq_r2r1);

i = 1;
for d = [2 8 12 18 24 36]
    F =@(ma1,Rho) tand(d).^2-(ma1.^2.*(2*Rho./((r+1)*ma1.^2-Rho.*(r-1).*ma1.^2))-1).^2.*(1-(2.*Rho./((r+1).*ma1.^2-Rho.*(r-1).*ma1.^2)))./(1+ma1.^2.*(r./2+0.5-(2.*Rho./((r+1).*ma1.^2-Rho.*(r-1).*ma1.^2)))).^2./(2.*Rho./((r+1).*ma1.^2-Rho.*(r-1).*ma1.^2));
    fimplicit(fig_obliq_r2r1,F,[1,10,1,6],'LineWidth',1);
    legend_str{i} = ['\delta =' num2str(d) '°'];
    i = i+1;
    hold on
end
hold off
grid on
set(fig_obliq_r2r1,'GridLineStyle','--')
set(fig_obliq_r2r1,'XScale', 'log') %x轴取对数坐标
set(fig_obliq_r2r1,'Xtick',1:10)
title(['\rho_2','/','\rho_1','-','Ma_1 Figure'])
xlabel('Ma_1')
ylabel(['\rho_2','/','\rho_1'])
legend(legend_str,'Location','bestoutside');

%% RP-Ma1
fig_obliq_p2p1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_obliq_p2p1',fig_obliq_p2p1);

i = 1;
for d=[2 8 12 18 24 36]
    f=@(Ma1,P) tand(d).^2-(Ma1.^2.*((P.*(r+1)+(r-1))./2./r./Ma1.^2)-1).^2.*(1-((P.*(r+1)+(r-1))./2./r./Ma1.^2))./(1+Ma1.^2.*(r./2+0.5-((P.*(r+1)+(r-1))./2./r./Ma1.^2))).^2./((P.*(r+1)+(r-1))./2./r./Ma1.^2);
    fimplicit(fig_obliq_p2p1,f,[1,10],'LineWidth',0.8);
    legend_str{i} = ['\delta =' num2str(d) '°'];
    i = i+1;
    hold on
end
hold off
grid on
title(['p_2','/','p_1','-','Ma_1 Figure'])
xlabel('Ma_1')
ylabel(['p_2','/','p_1'])
set(fig_obliq_p2p1,'GridLineStyle','--')
set(fig_obliq_p2p1,'YScale', 'log') %y轴取对数坐标
set(fig_obliq_p2p1,'Ytick',1:10)
legend(legend_str,'Location','bestoutside');

%% RT-Ma1
fig_obliq_t2t1 = axes('Parent',h_fig,...
                        'Units','normalized',...
                        'Position',[0.06, 0.08, 0.6, 0.75],...
                        'XTick',[],...
                        'YTick',[],...
                        'Box','On');
setappdata(h_fig,'fig_obliq_t2t1',fig_obliq_t2t1);

syms B ma1 d T
f_temp = T-(2+(r-1)*ma1^2*B)*(2*r*ma1^2*B-(r-1))/(r+1)^2/ma1^2/B;
result = solve(f_temp,B);
B = result(2);
i = 1;
for d = [2 8 12 18 24 36]
    Ff = tand(d)^2-(ma1^2*B-1)^2*(1-B)/(1+ma1^2*(r/2+0.5-B))^2/B;
    fun = matlabFunction(Ff);
    fimplicit(fig_obliq_t2t1,fun,[1,10,1,6],'LineWidth',1);
    legend_str{i} = ['\delta =' num2str(d) '°'];
    i = i+1;
    hold on
end
hold off
grid on
set(fig_obliq_t2t1,'GridLineStyle','--')
set(fig_obliq_t2t1,'XScale', 'log') %x轴取对数坐标
set(fig_obliq_t2t1,'Xtick',1:10)
title(['T_2','/','T_1','-','Ma_1 Figure'])
xlabel('Ma_1')
ylabel(['T_2','/','T_1'])
legend(legend_str,'Location','bestoutside');

%% 初始化可见性
callback_switchFig(h_fig)