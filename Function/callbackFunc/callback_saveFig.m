function callback_saveFig(~,~,h_fig)
% 保存当前图窗的图像
[name, path, index] = uiputfile('*.png','');

if index == 0
    return
else
    filename = fullfile(path,name);
    saveas(gca,filename);
end

end