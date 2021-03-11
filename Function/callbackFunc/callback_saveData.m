function callback_saveData(~,~,h_fig)
% 将记录的数据导出保存
% 分为两个sheet:Normal & Oblique
% Normal : ma1 ma2 beta r2r1 p2p1 t2t1
% Oblique : ma1 ma2 beta r2r1 p2p1 t2t1 theta
data = guidata(h_fig);
% 当没有数据可以保存时 警告并退出
if isempty(data.NormRecordData) && isempty(data.ObliRecordData)
    warndlg('您还未记录数据，无法保存！')
    return
end

if writefile(data.NormRecordData,data.ObliRecordData)
    msgbox('保存成功！','Success','modal');
end

end

