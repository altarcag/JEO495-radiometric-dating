clc; clear;
dataset = xlsread('./sample_1.xlsx');
x = dataset(:,1);
y = dataset(:,2);
p = polyfit(x,y,1);
f = polyval(p,x);
l = 10^11 / 1.42;    % lambda value for Rubidium
m = p(1);
y_i = p(2);  % the y-intersect value for initial isotope ratio
t = log(m + 1) * l;  % Rb/Sr age of the sample

fprintf('Slope (m) = %f\n', m); % slope
fprintf('age (t) = %e\n', t);   % age

plot(x,y,'o',x,f,'-')
legend('data','linear fit', 'Location', 'southeast')

% annotations for slope, age, and the initial isotope ratio(s)
slope_annotation = sprintf('Slope (m) = %.4f', m);
age_annotation = sprintf('Age (t) = %.4e', t);
y_i_annotation = sprintf('Initial 87Sr/86Sr = %.4f', y_i);
text(20, 0.98 * max(y), slope_annotation, 'FontSize', 12);
text(20, 0.91 * max(y), age_annotation, 'FontSize', 12);
text(20, 0.85 * max(y), y_i_annotation, 'FontSize', 12);

% adding labels to the x and y axes
xlabel('87Rb/86Sr');
ylabel('87Sr/86Sr');
