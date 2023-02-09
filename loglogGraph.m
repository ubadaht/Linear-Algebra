% Function definition
f = @(x) atan(x);

% Derivative of the function
df = @(x) 1 / (1 + x^2);

% Point x at which the derivative is to be calculated
r = sqrt(2);

% Exact value of the derivative at x
exact = df(r);

% Initialize arrays for h values, backward differences, forward differences,
% central differences, and errors
h = logspace(-32, -1, 100);
backward = zeros(1, 100);
forward = zeros(1, 100);
central = zeros(1, 100);
err_back = zeros(1, 100);
err_for = zeros(1, 100);
err_cent = zeros(1, 100);

% Loop to calculate backward differences, forward differences, central
% differences and errors for each h value
for i = 1:100
backward(i) = (f(r) - f(r - h(i))) / h(i);
forward(i) = (f(r + h(i)) - f(r)) / h(i);
central(i) = (f(r + h(i)) - f(r - h(i))) / (2 * h(i));
err_back(i) = abs(exact - backward(i)) / abs(exact);
err_for(i) = abs(exact - forward(i)) / abs(exact);
err_cent(i) = abs(exact - central(i)) / abs(exact);
end

% Log-log plot of relative error for different approximation methods
loglog(h, err_back, '-', 'DisplayName', 'Backward Differences');
hold on;
loglog(h, err_for, '-', 'DisplayName', 'Forward Differences');
loglog(h, err_cent, '-', 'DisplayName', 'Central Differences');
xlabel('Step Size h');
ylabel('Relative Error');
legend('show');
hold off;