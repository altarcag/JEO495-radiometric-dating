clc; clear;
dataset = xlsread('./sample_1.xlsx');
x = dataset(:,1);
y = dataset(:,2);
num_data_x = length(x);
num_data_y = length(y);

if num_data_x ~= num_data_y
    error('quantity of each column x and y do not match');
end

fprintf('Number of data points N = %d\n', num_data_x)

l = 10^11 / 1.42;    % lambda value for Rubidium
N = num_data_x;
S_x = sum(x);
S_y = sum(y);
xy = x .* y;
S_xy = sum(xy);
x2 = x.^2;
S_x2 = sum(x2);
Sx_2 = sum(x).^2;

fprintf('N = %i\n', N)
fprintf('Sum of x = %f\n', S_x)
fprintf('Sum of y = %f\n', S_y)
fprintf('Sum of xy = %f\n', S_xy)
fprintf('Sum of (x^2) = %f\n', S_x2)
fprintf('(Sum of x)^2 = %f\n', Sx_2)

m = ((N * S_xy) - (S_x * S_y)) / ((N * S_x2) - (Sx_2));
t = log(m + 1) * l;  % Rb/Sr age of the sample

fprintf('m = %f\n', m)
fprintf('t = %e\n', t)