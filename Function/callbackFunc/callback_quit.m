function callback_quit(~,~,h_fig)
% �˳�����

selection = questdlg('�Ƿ��˳�����','�˳�����','Yes','No','Yes');
switch selection
    case 'Yes'
        delete(h_fig)
    case 'No'
        return
end

end

