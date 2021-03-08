function callback_calData(~,~,h_fig)
% 创建新图窗
[name,path,index] = uigetfile('*.xlsx','请选择文件');
if index == 0
    return;
end
filename = fullfile(path,name);
% 读取table
T_Norm = readtable(filename,'Sheet','Normal_Shock_Data');
T_Obli = readtable(filename,'Sheet','Oblique_Shock_Data');
% 正斜激波输入是否为空检查
isNormEmpty = isempty(T_Norm);
isObliEmpty = isempty(T_Obli);

%% 正激波
if ~isNormEmpty
    % 格式检查
    if width(T_Norm) ~= 6
        % 正激波参数不等于6则存在格式问题
        errordlg('错误！请检查正激波表格格式正确性！','错误的格式','modal')
        return
    end

    % 判断输入参数数量正确性
    num_arg = 0;
    input_index_Norm = [];
    for i = 1:2
        if howmanynan( T_Norm{:,i} ) == 0     % 输入参数合法
            num_arg = num_arg + 1;  % 记录参数个数
            input_index_Norm = [input_index_Norm, i];   % 记录是哪个参数输入：1. Ma1  2. Ma2
        end
    end
    if num_arg ~= 1
        errordlg('错误！请检查正激波表格数据格式！','错误的输入','modal')
        return
    end
end

%% 斜激波
if ~isObliEmpty
    % 格式检查
    if width(T_Obli) ~= 7
        % 斜激波参数不等于7则存在格式问题
        errordlg('错误！请检查斜激波表格格式正确性！','错误的格式','modal')
        return
    end

    % 判断输入参数数量正确性
    num_arg = 0;
    input_index_Obli = [];
    for i = [1,2,3,7]
        if howmanynan( T_Obli{:,i} ) == 0     % 输入参数合法
            num_arg = num_arg + 1;  % 记录参数个数
            input_index_Obli = [input_index_Obli,i];    % 记录输入参数1：Ma1 2: Ma2 3:Beta 7:theta
        end
    end
    if num_arg ~= 2
        errordlg('错误！请检查斜激波表格数据格式！','错误的输入','modal')
        return
    else
        % 如果参数合法则对输入的参数编码
        if (input_index_Obli(1)==1) && (input_index_Obli(2)==2)
            warndlg('目前尚不支持Ma1和Ma2查值！');
            return;
            code = 'ma1ma2';
        elseif (input_index_Obli(1)==1) && (input_index_Obli(2)==3)
            code = 'ma1beta';
        elseif (input_index_Obli(1)==1) && (input_index_Obli(2)==7)
            code = 'ma1theta';
        elseif (input_index_Obli(1)==2) && (input_index_Obli(2)==3)
            code = 'ma2beta';
        elseif (input_index_Obli(1)==2) && (input_index_Obli(2)==7)
            code = 'ma2theta';
        elseif (input_index_Obli(1)==3) && (input_index_Obli(2)==7)
            code = 'betatheta';
        end
    end
end

%% 计算
% 正激波
Norm = [];
if ~isNormEmpty
    switch input_index_Norm
        case 1
            % Ma1
            m2 = normalm1_m2(T_Norm{:,1});
            r2r1 = normalm1_RD(T_Norm{:,1});
            p2p1 = normalm1_RP(T_Norm{:,1});
            T2T1 = normalm1_RT(T_Norm{:,1});
            beta = 90*ones(height(T_Norm),1);
            Norm = [T_Norm{:,1},m2,beta,r2r1,p2p1,T2T1];
        case 2
            % Ma2
            m1 = normalm2_m1(T_Norm{:,2});
            r2r1 = normalm2_RD(T_Norm{:,2});
            p2p1 = normalm2_RP(T_Norm{:,2});
            T2T1 = normalm2_RT(T_Norm{:,2});
            beta = 90*ones(height(T_Norm),1);
            Norm = [m1,T_Norm{:,2},beta,r2r1,p2p1,T2T1];
    end
   
end

% 斜激波
Obli = [];
Obli_ruo = [];
Obli_qiang = [];
if ~isObliEmpty
   switch code
       case 'ma1ma2'
           
       case 'ma1beta'
           for item = 1:height(T_Obli)
               [m1 , m2, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma1','beta',[T_Obli{item,1}, T_Obli{item,3}],1); 
               Obli = [Obli;m1 , m2, beta, r2r1, p2p1, T2T1, theta];
           end
           
       case 'ma1theta'
           for item = 1:height(T_Obli)
               [m1 , m2, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma1','theta',[T_Obli{item,1}, T_Obli{item,7}],1); 
               Obli_ruo = [Obli_ruo;m1 , m2(1), beta(1), r2r1(1), p2p1(1), T2T1(1), theta];
               Obli_qiang = [Obli_qiang;m1 , m2(2), beta(2), r2r1(2), p2p1(2), T2T1(2), theta];
           end
       case 'ma2beta'
           for item = 1:height(T_Obli)
               [m1 , m2, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma2','beta',[T_Obli{item,2}, T_Obli{item,3}],1); 
               Obli = [Obli;m1 , m2, beta, r2r1, p2p1, T2T1, theta];
           end
       case 'ma2theta'
           for item = 1:height(T_Obli)
               [m1 , m2, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'ma2','theta',[T_Obli{item,2}, T_Obli{item,7}],1); 
               Obli = [Obli;m1 , m2, beta, r2r1, p2p1, T2T1, theta];
           end
       case 'betatheta'
           for item = 1:height(T_Obli)
               [m1 , m2, beta, r2r1, p2p1, T2T1, theta] = getObliValue(h_fig,'beta','theta',[T_Obli{item,3}, T_Obli{item,7}],1); 
               Obli = [Obli;m1 , m2, beta, r2r1, p2p1, T2T1, theta];
           end
   end
end

%% 输出保存
answer = questdlg('已计算完毕！保存请选择路径', ...
	'计算完毕', ...
	'选择路径','取消','选择路径');
switch answer
    case '选择路径'
        if strcmp(code,'ma1theta')
            if writefile(Norm,Obli_ruo,Obli_qiang)
                msgbox('保存成功！','Success','modal');
            end
        else
            if writefile(Norm,Obli)
                msgbox('保存成功！','Success','modal');
            end
        end
    case '取消'
        return;
end
end

