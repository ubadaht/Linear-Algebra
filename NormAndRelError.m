% Define the exact solution
x_exact = ones(size(x));

% Compute the residue
residue = b - A*x;

% Compute the norm of the residue
norm_residue = norm(residue);

% Compute the relative error
rel_error = (x - x_exact)./x_exact;

% Compute the norm of the relative error
norm_rel_error = norm(rel_error);

% Print the results
fprintf('The norm of the residue is: %f\n', norm_residue);
fprintf('The norm of the relative error is: %f\n', norm_rel_error);
