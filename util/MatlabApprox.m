%%  @package MatlabApprox
%
%   @brief MatlabApprox function that compares two values
%
%   @details Function to check to see if 2 given values/variables are approximately
%             equal to each other. This is accomplished by providing the two
%             values/variables to be compared, along with some options on
%             tolerances.
%
%   @author Austin Ladshaw
%
%   @date 09/12/2022
%
%   @copyright This software was designed and built at SPAN for
%               demonstration purposes ONLY. Copyright (c) 2022,
%               all rights reserved.


%% Function to make the comparisons between 2 values
%
%   return -> bool (True if they are approximately equal)
%
%   @param v1 Variable 1
%   @param v2 Variable 2
%   @param reltol Value of relative tolerance for comparison (default = 1e-4)
%   @param abstol Value of absolute tolerance for comparison (default = 1e-4)
%   @param method Type of comparison to make (default = 'Relative')
function result = MatlabApprox(v1, v2, reltol, abstol, method)
    arguments
        v1 (1,:) {mustBeNumeric}
        v2 (1,:) {mustBeNumeric,mustBeEqualSize(v1,v2)}
        reltol (1,1) {mustBeNumeric,mustBeReal} = 1e-4
        abstol (1,1) {mustBeNumeric,mustBeReal} = 1e-4
        method (1,:) char {mustBeMember(method,{'Relative','Absolute'})} = 'Relative'
    end

    % Comparison for relative norms
    if strcmp(method,'Relative')
      if norm(v1,1) > 0
        if norm(v1-v2,1)/norm(v1,1) <= reltol
          result = true;
        else
          result = false;
        end
      elseif norm(v2,1) > 0
        if norm(v1-v2,1)/norm(v2,1) <= reltol
          result = true;
        else
          result = false;
        end
      else
        result = true;
      end
    % Comparison for absolute norms
    elseif strcmp(method,'Absolute')
      if norm(v1-v2,1) <= abstol
        result = true;
      else
        result = false;
      end
    % Handling invalid selection
    else
      causeException = MException('MATLAB:invalidInput','Invalid Input Args.');
      baseException = addCause(baseException,causeException);
      throw(baseException)
    end

end
