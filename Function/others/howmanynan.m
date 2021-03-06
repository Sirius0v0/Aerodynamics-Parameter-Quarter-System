function [num, index] = howmanynan(args)
% 统计args数列有多少个NaN, 并返回非NaN的位置下标
num = 0;
index = [];
for i = 1 : length(args)
    if isnan(args(i))
        num = num + 1;
    else
        index = [index,i];
    end
end
end

