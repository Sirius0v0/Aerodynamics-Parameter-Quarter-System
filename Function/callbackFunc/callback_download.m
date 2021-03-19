function callback_download(~,~,h_fig)
% 下载批量计算的数据模板
Norm = [1.2, NaN, NaN, NaN, NaN, NaN;
        1.4, NaN, NaN, NaN, NaN, NaN;
        1.8, NaN, NaN, NaN, NaN, NaN;
        2.7, NaN, NaN, NaN, NaN, NaN;
        4.85, NaN, NaN, NaN, NaN, NaN;
        5.6, NaN, NaN, NaN, NaN, NaN;
        20, NaN, NaN, NaN, NaN, NaN;
        30, NaN, NaN, NaN, NaN, NaN;
        38, NaN, NaN, NaN, NaN, NaN;
        48, NaN, NaN, NaN, NaN, NaN];
Obli = [NaN, 1.4912, NaN, NaN, NaN, NaN, 29;
        NaN, 1.218, NaN, NaN, NaN, NaN, 10.5;
        NaN, 1.0515, NaN, NaN, NaN, NaN, 25.5;
        NaN, 1.488, NaN, NaN, NaN, NaN, 14;
        NaN, 1.1121, NaN, NaN, NaN, NaN, 21.5;
        NaN, 1.2214, NaN, NaN, NaN, NaN, 39;
        NaN, 1.721, NaN, NaN, NaN, NaN, 38.5;
        NaN, 1.114, NaN, NaN, NaN, NaN, 45;
        NaN, 3.0934, NaN, NaN, NaN, NaN, 13;
        NaN, 1.1531, NaN, NaN, NaN, NaN, 35.5];
    
if writefile(Norm, Obli)
    msgbox('模板已生成！','Success','modal');
    warndlg('注意！模板格式不可改动！','提示','modal')
end

end

