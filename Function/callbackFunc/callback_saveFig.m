function callback_saveFig(~,~,h_fig)
% 保存当前图窗的图像
[name, path, index] = uiputfile('*.png','选择保存路径');

if index == 0
    return
else
    filename = fullfile(path,name);
    
    index_houzhui = find(filename == '.');
    if ~ismember(filename(index_houzhui(end):end),{'.xlsx';'.xls';'.xlsm';'.txt';'.csv'})
        errordlg('错误！请检查文件名后缀是否合法！','错误的文件名','modal')
        return
    end
    
    saveas(gca,filename);
end

end