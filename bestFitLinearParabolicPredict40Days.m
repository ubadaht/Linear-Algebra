% Define the data
day = [0 4 8 12 16 20];
amount = [67 84 98 125 149 185];

% Plot the data
figure;
plot(day, amount, 'o');
xlabel('Day');
ylabel('Amount (in 10^6)');
title('Bacterial Growth in Liquid Culture');

% Linear approximation
p1 = polyfit(day, amount, 1);
y1 = polyval(p1, day);
hold on;
plot(day, y1, 'r-');

% Parabolic approximation
p2 = polyfit(day, amount, 2);
y2 = polyval(p2, day);
plot(day, y2, 'g-');
legend('Data', 'Linear', 'Parabolic');

% Predict the amount of bacteria after 40 days
linear_amount = polyval(p1, 40);
parabolic_amount = polyval(p2, 40);
fprintf('Linear approximation after 40 days: %f\n', linear_amount);
fprintf('Parabolic approximation after 40 days: %f\n', parabolic_amount);