function isdone = writefile(Norm,Obli,Obli_qiang)
% 操作写文件
% 共.xlsx .xls .xlsm .txt .csv五种格式

if nargin == 2
    % 根据输入参数个数判断是否写文件斜激波的强解
    isonlyRuo = 1;
else
    isonlyRuo = 0;
end

isdone = 0;
[name, path, index] = uiputfile({'*.xlsx';'*.xls';'*.xlsm';'*.txt';'*.csv'},'选择保存路径');
if index == 0
    return
elseif (index == 1) || (index == 2) || (index == 3)
    % 表格格式
    filename = fullfile(path,name); % 拼接文件路径
    
    index_houzhui = find(filename == '.');
    if ~ismember(filename(index_houzhui(end):end),{'.xlsx';'.xls';'.xlsm';'.txt';'.csv'})
        errordlg('错误！请检查文件名后缀是否合法！','错误的文件名','modal')
        return
    end
    
    if ~isempty(Norm)
        % 保存正激波
        [row, ~] = size(Norm);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = Norm(:,1);
        Ma2 = Norm(:,2);
        Beta = Norm(:,3);
        r2r1 = Norm(:,4);
        p2p1 = Norm(:,5);
        t2t1 = Norm(:,6);
        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,'RowNames',xuhao);
        writetable(T,filename,'Sheet','Normal_Shock_Data');
    end
    
    if ~isempty(Obli)        
        % 保存斜激波
        [row, ~] = size(Obli);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = Obli(:,1);
        Ma2 = Obli(:,2);
        Beta = Obli(:,3);
        r2r1 = Obli(:,4);
        p2p1 = Obli(:,5);
        t2t1 = Obli(:,6);
        theta = Obli(:,7);

        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,theta,'RowNames',xuhao);
        writetable(T,filename,'Sheet','Oblique_Shock_Data');
    end
    if ~isonlyRuo
        
        % 保存斜激波强解数值
        [row, ~] = size(Obli_qiang);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = Obli_qiang(:,1);
        Ma2 = Obli_qiang(:,2);
        Beta = Obli_qiang(:,3);
        r2r1 = Obli_qiang(:,4);
        p2p1 = Obli_qiang(:,5);
        t2t1 = Obli_qiang(:,6);
        theta = Obli_qiang(:,7);

        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,theta,'RowNames',xuhao);
        writetable(T,filename,'Sheet','Strong_Shock_Solution');
        
    end
    
elseif (index == 4)
    % 文本文件
    filename = fullfile(path,name); % 拼接文件路径
    if ~isempty(Norm)
        % 保存正激波
        [row, ~] = size(Norm);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = Norm(:,1);
        Ma2 = Norm(:,2);
        Beta = Norm(:,3);
        r2r1 = Norm(:,4);
        p2p1 = Norm(:,5);
        t2t1 = Norm(:,6);
        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,'RowNames',xuhao);
        writematrix('Normal Shock Data:',filename);
        writematrix('----------------------',filename,'WriteMode','append');
        writetable(T,filename,'WriteRowNames',1,'Delimiter','\t','WriteMode','append');
    end
    
    if ~isempty(Obli)        
        % 保存斜激波
        [row, ~] = size(Obli);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = Obli(:,1);
        Ma2 = Obli(:,2);
        Beta = Obli(:,3);
        r2r1 = Obli(:,4);
        p2p1 = Obli(:,5);
        t2t1 = Obli(:,6);
        theta = Obli(:,7);

        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,theta,'RowNames',xuhao);
        if ~isempty(Norm)
            writematrix('',filename,'WriteMode','append');
            writematrix('',filename,'WriteMode','append');
            writematrix('====================================================================',filename,'WriteMode','append');
            writematrix('',filename,'WriteMode','append');
            writematrix('',filename,'WriteMode','append');
            writematrix('Oblique Shock Data:',filename,'WriteMode','append');
            writematrix('----------------------',filename,'WriteMode','append');
            writetable(T,filename,'WriteRowNames',1,'WriteVariableNames',1,'Delimiter','\t','WriteMode','append');
        else
            writematrix('Oblique Shock Data:',filename);
            writematrix('----------------------',filename,'WriteMode','append');
            writetable(T,filename,'WriteRowNames',1,'WriteVariableNames',1,'Delimiter','\t','WriteMode','append');
        end       
    end
    if ~isonlyRuo
            
        % 保存斜激波强解部分
        [row, ~] = size(Obli_qiang);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = Obli_qiang(:,1);
        Ma2 = Obli_qiang(:,2);
        Beta = Obli_qiang(:,3);
        r2r1 = Obli_qiang(:,4);
        p2p1 = Obli_qiang(:,5);
        t2t1 = Obli_qiang(:,6);
        theta = Obli_qiang(:,7);

        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,theta,'RowNames',xuhao);
        writematrix('',filename,'WriteMode','append');
        writematrix('',filename,'WriteMode','append');
        writematrix('====================================================================',filename,'WriteMode','append');
        writematrix('',filename,'WriteMode','append');
        writematrix('',filename,'WriteMode','append');
        writematrix('Oblique Shock Data(strong shock solution):',filename,'WriteMode','append');
        writematrix('----------------------',filename,'WriteMode','append');
        writetable(T,filename,'WriteRowNames',1,'WriteVariableNames',1,'Delimiter','\t','WriteMode','append');            
    end
else
    
    % csv文件
    filename = fullfile(path,name); % 拼接文件路径
    if ~isempty(Norm)
        % 保存正激波
        [row, ~] = size(Norm);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = Norm(:,1);
        Ma2 = Norm(:,2);
        Beta = Norm(:,3);
        r2r1 = Norm(:,4);
        p2p1 = Norm(:,5);
        t2t1 = Norm(:,6);
        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,'RowNames',xuhao);
        writematrix('Normal Shock Data:',filename);
        writematrix('----------------------',filename,'WriteMode','append');
        writetable(T,filename,'WriteRowNames',1,'WriteMode','append');
    end
    
    if ~isempty(Obli)        
        % 保存斜激波
        [row, ~] = size(Obli);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = Obli(:,1);
        Ma2 = Obli(:,2);
        Beta = Obli(:,3);
        r2r1 = Obli(:,4);
        p2p1 = Obli(:,5);
        t2t1 = Obli(:,6);
        theta = Obli(:,7);

        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,theta,'RowNames',xuhao);
        if ~isempty(Norm)
            writematrix('',filename,'WriteMode','append');
            writematrix('',filename,'WriteMode','append');
            writematrix('====================================================================',filename,'WriteMode','append');
            writematrix('',filename,'WriteMode','append');
            writematrix('',filename,'WriteMode','append');
            writematrix('Oblique Shock Data:',filename,'WriteMode','append');
            writematrix('----------------------',filename,'WriteMode','append');
            writetable(T,filename,'WriteRowNames',1,'WriteVariableNames',1,'WriteMode','append');
        else
            writematrix('Oblique Shock Data:',filename);
            writematrix('----------------------',filename,'WriteMode','append');
            writetable(T,filename,'WriteRowNames',1,'WriteVariableNames',1,'WriteMode','append');
        end
        
    end
    if ~isonlyRuo
        
        % 保存斜激波强解数据
        [row, ~] = size(Obli_qiang);
        xuhao = cell(row,1);
        % 构造列序号名字
        for i = 1:row
            xuhao{i} = num2str(i);
        end
        % 构造要保存的数据列
        Ma1 = Obli_qiang(:,1);
        Ma2 = Obli_qiang(:,2);
        Beta = Obli_qiang(:,3);
        r2r1 = Obli_qiang(:,4);
        p2p1 = Obli_qiang(:,5);
        t2t1 = Obli_qiang(:,6);
        theta = Obli_qiang(:,7);

        % 创建表格
        T = table(Ma1,Ma2,Beta,r2r1,p2p1,t2t1,theta,'RowNames',xuhao);
        writematrix('',filename,'WriteMode','append');
        writematrix('',filename,'WriteMode','append');
        writematrix('====================================================================',filename,'WriteMode','append');
        writematrix('',filename,'WriteMode','append');
        writematrix('',filename,'WriteMode','append');
        writematrix('Oblique Shock Data(strong shock solution):',filename,'WriteMode','append');
        writematrix('----------------------',filename,'WriteMode','append');
        writetable(T,filename,'WriteRowNames',1,'WriteVariableNames',1,'WriteMode','append');
        
    end
end
isdone = 1;
end

