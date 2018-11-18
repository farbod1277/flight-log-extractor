classdef FlightData
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
        time                                                   %time vector
        BATVolt                                            %Battery Voltage
        BATCurr                                            %Battery Current
        BATCurrTot                                   %Battery Current Total
    end
    
    methods
        function obj = FlightData(path)
            %This is called once an instance of the class is created.
            
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

