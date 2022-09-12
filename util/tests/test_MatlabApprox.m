% Test MatlabApprox

% Add the path
addpath('..');

% Run a selection of tests
disp('Test 1')
assert( MatlabApprox(1,1, 1e-4, 1e-4, 'Relative') )

disp('Test 2')
assert( MatlabApprox(1,1, 1e-4, 1e-4, 'Absolute') )

disp('Test 3')
assert( MatlabApprox(0,1, 1e-4, 1e-4, 'Relative') == false)

disp('Test 4')
assert( MatlabApprox(1,0, 1e-4, 1e-4, 'Relative') == false)

disp('Test 5')
assert( MatlabApprox(0,0, 1e-4, 1e-4, 'Relative') )


disp('Test 6')
assert( MatlabApprox([1,2,-1],[1,2,-1], 1e-4, 1e-4, 'Relative') )

disp('Test 7')
assert( MatlabApprox([1,2,-1],[1,2,-1], 1e-4, 1e-4, 'Absolute') )

disp('Test 8')
assert( MatlabApprox([1,2,1],[1,2,-1], 1e-4, 1e-4, 'Relative') == false)

disp('Test 9')
assert( MatlabApprox([1,2,-1],[1,2,1], 1e-4, 1e-4, 'Relative') == false)



