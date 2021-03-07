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
[name, path, index] = uiputfile({'*.xlsx';'*.xls';'*.xlsm';'*.txt';'*.csv'},'');

if index == 0
    return
else
    filename = fullfile(path,name); % 拼接文件路径
    if ~isempty(data.NormRecordData)
        % 保存正激波
        [row, ~] = size(data.NormRecordData);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = data.NormRecordData(:,1);
        Ma2 = data.NormRecordData(:,2);
        Beta = data.NormRecordData(:,3);
        r2r1 = data.NormRecordData(:,4);
        p2p1 = data.NormRecordData(:,5);
        t2t1 = data.NormRecordData(:,6);
        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,'RowNames',xuhao);
        T
        writetable(T,filename,'Sheet','Normal_Shock_Data');
    end
    
    if ~isempty(data.ObliRecordData)
        % 保存斜激波
        [row, ~] = size(data.ObliRecordData);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = data.ObliRecordData(:,1);
        Ma2 = data.ObliRecordData(:,2);
        Beta = data.ObliRecordData(:,3);
        r2r1 = data.ObliRecordData(:,4);
        p2p1 = data.ObliRecordData(:,5);
        t2t1 = data.ObliRecordData(:,6);
        theta = data.ObliRecordData(:,7);

        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,theta,'RowNames',xuhao);
        writetable(T,filename,'Sheet','Oblique_Shock_Data');
    end
    
end

end

