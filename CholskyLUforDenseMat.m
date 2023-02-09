A = load('SystemAxb_A.mat', '-mat');

% Check if B is positive definite
R = chol(A);
if isempty(R)
    disp('Matrix A is not positive definite');
else
    disp('Matrix A is positive definite');
end

tic;
% Perform LU decomposition on A
[L,U,P] = lu(A);

% Solve the system using forward and backward substitution
y = L\(P*b);
x = U\y;
time_LU = toc;


% Check the solution
disp('Solution x:')
disp(x)

tic;
% Perform Cholesky decomposition on A
R = chol(A);

% Solve the system using forward and backward substitution
y = R'\(R\b);
x = R\y;
time_Chol = toc;

% Check the solution
disp('Solution x:')
disp(x)

disp(['Computational time for method (a): ', num2str(time_LU), ' seconds']);
disp(['Computational time for method (b): ', num2str(time_Chol), ' seconds']);