% Define the time and cells data
time = [0 1 2 3 4 5 6];
cells = [0.100 0.332 1.102 1.644 2.453 3.660 5.460];

% Plot the data
figure(1)
plot(time, cells, 'o')
xlabel('Time (hr)')
ylabel('Cells (g/L)')
title('Bacterial Growth')

% Define the linear and quadratic approximations
H_lin = [ones(length(time),1), time'];
H_quad = [ones(length(time),1), time', time'.^2];

% Compute the linear and quadratic approximation polynomials using Solve_NE()
a_lin = Solve_NE(H_lin, cells');
a_quad = Solve_NE(H_quad, cells');

% Plot the linear and quadratic polynomials
hold on
t = linspace(0, 6);
y_lin = polyval(fliplr(a_lin'), t);
y_quad = polyval(a_quad, t);
plot(t, y_lin, 'r')
plot(t, y_quad, 'g')
legend('Data', 'Linear Approximation', 'Quadratic Approximation')

% Estimate the specific growth rate during the first 2 hours
t1 = time(1:2);
c1 = cells(1:2);
a1_lin = Solve_NE([ones(length(t1),1), t1'], c1');
r1 = a1_lin(2);
fprintf('Specific growth rate during the first 2 hours: %.4f\n', r1)

% Estimate the specific growth rate during the next 4 hours
t2 = time(3:end);
c2 = cells(3:end);
a2_lin = Solve_NE([ones(length(t2),1), t2'], c2');
r2 = a2_lin(2);

% Display the specific growth rates
fprintf('Specific growth rate during the next 4 hours: %.4f\n', r2)

function [a] = Solve_NE(H, y)

% Transpose H
H_transpose = H';

% Calculate the normal equations
A = H_transpose * H;
b = H_transpose * y;

% Solve the normal equations using Cholesky factorization
R = chol(A);
z = R' \ b;
a = R \ z;
end