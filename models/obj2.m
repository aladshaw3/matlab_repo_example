%%  @package obj2
%
%   @brief Matlab object for demo purposes
%
%   @details Matlab object for the express purpose of demonstration of
%             the Matlab Assembler object.
%
%   @author Austin Ladshaw
%
%   @date 09/07/2022
%
%   @copyright This software was designed and built at SPAN for
%               demonstration purposes ONLY. Copyright (c) 2022,
%               all rights reserved.
classdef obj2

    %% Defined parameter / properties information for obj2
    %
    %   Each object fed to the Assembler will need to know what
    %   the variables are indexed by in the global system. Ideally,
    %   that logic should be handled by the Assembler, but for this
    %   demo, we assume that that information in known and defined
    %   here.
    properties
        varMap  % Map of variable indices
        funMap  % Map of function indices
        parMap  % Map of parameter values
    end

    %% Defined set of methods / functions that the obj2 has
    methods
        %% Default Constructor
        %
        %   This constructor method defines what to do once an
        %   instance of the obj2 is created.
        %
        %   return -> None
        %
        function obj = obj2()
            % Ideally, these would be determined in the Assembler,
            % except for the 'parMap', but for now we will define
            % it here for the demo.
            obj.varMap = containers.Map({'x1','x2','x3'},{1,2,3});
            obj.funMap = containers.Map({'f2','f3'},{1,2});
            obj.parMap = containers.Map({'a','b','c'},{0.5,2,1});
        end

        %% The residual vector contribution from obj2
        %
        %   This is the function that the Assembler will call
        %   in order to bring all equations and relationships
        %   together for the solver.
        %
        %   return -> (Nx1) Matrix (The residual vector)
        %
        %   @param x The (Nx1) Matrix for the variable set in the system
        function F = Residual(obj, x)
            % Residual Function(s):
            %     f2 = x1 - x2*a
            %     f3 = c*x2 - x3*b
            F( obj.funMap('f2') ) = x(obj.varMap('x1')) - obj.parMap('a') * x(obj.varMap('x2'));
            F( obj.funMap('f3') ) = obj.parMap('c') * x(obj.varMap('x2')) - obj.parMap('b') * x(obj.varMap('x3'));
        end

    end

end
