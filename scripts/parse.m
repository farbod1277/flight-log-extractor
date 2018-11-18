function delimitedData = parse(path)
%Returns a cell array of the raw data delimited by ',' and '\n'

fid = fopen(path);
rawData = fscanf(fid,'%c');

delimitedByLineData = strsplit(rawData, '\n');

delimitedData = cell(length(delimitedByLineData),1);
for i = 1:length(delimitedByLineData)
    delimitedData{i} = strtrim(strsplit(string(delimitedByLineData(1,i)), ','));
end
end