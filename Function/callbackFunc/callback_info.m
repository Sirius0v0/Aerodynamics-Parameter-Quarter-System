function callback_info(~,~,h_fig)
% 创建信息页面
[icondata,iconcmap] = imread('icon\info_icon.png');
msgbox(info(),'关于','custom',icondata,iconcmap);
end