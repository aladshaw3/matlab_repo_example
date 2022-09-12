%% The 'test_script' script to run this example
% Call as 'result = runtests' from this directory
%   NOTE: Octave syntax is significantly different

% Add paths
addpath('../util');
addpath('../models');

% Create an instance of the Assembler
obj = Assembler();

% Attach each object/model needed to the Assembler
obj.Map('obj1') = obj1();
obj.Map('obj2') = obj2();

% Create an initial guess and call the Assembler.Solver
x0 = zeros(3,1);
x = obj.Solve(x0);

% Create 'assert' section for testing
assert( length(x) == 3 )

% Compare Results to Expected or 'Gold' result
x_gold = [1.1052; 2.2103; 1.1052];
assert( MatlabApprox(x, x_gold, 1e-4, 1e-4, 'Relative') )

