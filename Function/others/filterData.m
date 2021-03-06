function result = filterData(dataset,range)
% 筛选dataset在range内的部分
result = [];
for i = 1:length(dataset)
    if ( dataset(i) <= range(2) ) && ( dataset(i) >= range(1) )
        result = [result, dataset(i)];
    end
end

end

