

%to find the minimum number of subintervals and compute the errors:

f = @(x) 20 * (1 - x.^2).^3;
a = -1;
b = 1;
I = 18.2857142857143;
N = 2;
error = 1;
while error > 1e-4
IN = CompTrap_method(f, a, b, N);
error = abs(IN - I);
N = N + 1;
end
fprintf("The minimum number of subintervals is: %d\n", N);
fprintf("The relative error is: %e\n", error);

function IN = CompTrap_method(f, a, b, N)
h = (b - a) / N;
x = a:h:b;
y = f(x);
sumh = 0;
    for i = 2:N
        sumh = sumh + y(i);
    end
IN = (h / 2) * (y(1) + 2 * sumh + y(N + 1));
end
