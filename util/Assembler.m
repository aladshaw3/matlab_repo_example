%%  @package Assembler
%
%   @brief Matlab Assembler object that assembles other Matlab objects
%
%   @details Object-Oriented approach to interfacing between Matlab
%             objects that are part of a system of equations. This
%             This object is NOT production quality and is meant only
%             as a demonstration of how this could be accomplished.
%             The Assembler contains a 'Map' of other objects that
%             are passed into it. It then calls all the 'Residual'
%             functions of those objects and assembles those all
%             together into 1 full system of equations.
%
%   @author Austin Ladshaw
%
%   @date 09/07/2022
%
%   @copyright This software was designed and built at SPAN for
%               demonstration purposes ONLY. Copyright (c) 2022,
%               all rights reserved.
classdef Assembler

    %% Defined parameter / properties information for Assembler
    properties
        Map   % Map of other Matlab objects to be assembled
    end

    %% Defined set of methods / functions that the Assembler has
    methods
        %% Default Constructor
        %
        %   This constructor method defines what to do once an
        %   instance of the Assembler is created. User will be
        %   responsible for adding to the Map in their script.
        %
        %   return -> None
        %
        function obj = Assembler()
            obj.Map = containers.Map; % Initialize empty Map
        end

        %% Display to the console the valid keys in the 'Map'
        %
        %   This function will display to the user the valid and
        %   unique keys in the Assembler.Map object.
        %
        %   return -> None
        function show_keys(obj)
            for k = keys(obj.Map)
                disp(k);
            end
        end

        %% The assembled residual vector
        %
        %   This is the real work of the Assembler, where all
        %   base objects have their respective 'Residual' function
        %   called to be assembled into a full system of equations.
        %
        %   return -> (Nx1) Matrix (The residual vector)
        %
        %   @param x The (Nx1) Matrix for the variable set in the system
        function F = Residual(obj, x)
            i=1;  % Created an index for tracking
            F = []; % Created a blank residual vector
            for k = keys(obj.Map)
                % Call the individual object's own 'Residual'
                %   functions and append that to the residual
                %   vector F.
                F = [F, obj.Map(k{1}).Residual(x)];
                i=i+1;
            end

        end

        %% Assembler function to call the Matlab solver
        %
        %   This function will call the Matlab solver passing
        %   to it: (i) the Residual function (Assembler.Residual)
        %   and (ii) the initial guess vector (x0)
        %
        %   return -> (Nx1) Matrix (The solution to the system)
        %
        %   @param x0 The (Nx1) Matrix for the initial guess to the variables
        function x = Solve(obj, x0)
            x = fsolve(@obj.Residual, x0);
        end

    end

end
