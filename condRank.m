% Define the matrix A
A = rand(100,50);

% Calculate the singular values of A
s = svd(A);

% Plot the singular values of A
plot(s)
title('Singular Values of A')
xlabel('Index')
ylabel('Singular Value')

% Calculate the condition number of A
conditioning_index = s(1)/s(end);

% Calculate the rank of A
tolerance = max(size(A)) * eps(max(s));
k = sum(s > tolerance);

% Display the results
fprintf('The conditioning index of A is %f\n', conditioning_index);
fprintf('The rank of A is %d\n', k);