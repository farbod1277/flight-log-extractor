classdef FlightData < dynamicprops
    %A class which converts .mat files from mission planner into an easy to
    %use MATLAB class:
    %
    %   Use: data = FlightData("<path of .mat file>") in order to construct
    %   an instance of the class.
    %
    %   Use: time = FlightData.time() in order to get a time vector of the
    %   data. This is generated using a suitable time step and
    %   interpolation of the data from the .mat file.
    %   
    %   Use: time = FlightData.<flightdatavariable>(<time>) to get a vector
    %   of the data for the <flightdatavariable> at the given <time>
    
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

