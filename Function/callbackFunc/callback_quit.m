function callback_quit(~,~,h_fig)
% 退出程序

selection = questdlg('是否退出程序？','退出请求','Yes','No','Yes');
switch selection
    case 'Yes'
        delete(h_fig)
    case 'No'
        return
end

end

