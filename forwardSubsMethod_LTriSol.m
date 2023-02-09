% Build the lower-triangular coefficient matrix A
A = tril([2 -1 0; -1 2 -1; 0 -1 2]);

% Build the right-hand side vector b
b = [1; 2; 3];

% Solve the linear system using LTriSol
x = LTriSol(A, b);

% Check the solution
fprintf('The solution x is: \n')
disp(x)


function x = LTriSol(A, b)

% Get the size of the matrix
[n,~] = size(A);

% Initialize the solution vector
x = zeros(n,1);

% Perform forward substitution
for i = 1:n
    x(i) = (b(i) - A(i,1:i-1)*x(1:i-1))/A(i,i);
end

end
