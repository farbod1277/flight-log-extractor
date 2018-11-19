classdef FlightData < dynamicprops
    %FlightData Class
    
    properties
        delimitedData;
        P;
    end
    
    methods
        function obj = FlightData(path)
            % This is called once an instance of the class is created
            % The data is parsed from a .log file into cell arrays
            obj.delimitedData = parse(path);
        end
        
        function obtainData(obj, var)
            idx = cellfun(@(x)x(1),obj.delimitedData) == var;
            obj.P = addprop(obj, var);
            obj.(obj.P.Name) = {obj.delimitedData{idx,1}}';
        end
    end
end

function delimitedData = parse(path)
%Returns a cell array of the raw data delimited by ',' and '\n'

fid = fopen(path);
rawData = fscanf(fid,'%c');

delimitedByLineData = regexp(rawData, '\n', 'split');

delimitedData = strtrim(regexp(string(transpose(delimitedByLineData(1,:))), ',', 'split'));
end