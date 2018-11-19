function delimitedData = parse(path)
%Returns a cell array of the raw data delimited by ',' and '\n'

fid = fopen(path);
rawData = fscanf(fid,'%c');

delimitedByLineData = regexp(rawData, '\n', 'split');

delimitedData = strtrim(regexp(string(transpose(delimitedByLineData(1,:))), ',', 'split'));
end
