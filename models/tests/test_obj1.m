% Test for model/objects
%
% Test obj 1

% Add the path
addpath('..');             % Jump out 1 level to get access to 'models'
addpath('../../util');     % Jump out 2 levels, then into 'utils'

% Create instance of object
obj = obj1();

% Assert the object contains expected properties
assert( isKey(obj.varMap, 'x1') )
assert( isKey(obj.funMap, 'f1') )
assert( isKey(obj.parMap, 'a') )
assert( isKey(obj.parMap, 'b') )

% Change a parameter value and assert the change was accepted
obj.parMap('a') = 5;
obj.parMap('b') = 1;

assert( obj.parMap('a') == 5 )
assert( obj.parMap('b') == 1 )

% Create a residual calculation and assert we get the expected result
x0 = [1];
res = obj.Residual(x0);

assert( MatlabApprox(res, 4.6321) )
