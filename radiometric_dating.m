clc; clear;
dataset = xlsread('./sample_1.xlsx');
x = dataset(:,1);
y = dataset(:,2);
p = polyfit(x,y,1);
f = polyval(p,x);

l = 10^11 / 1.42;    % lambda value for Rubidium
m = p(1);
t = log(m + 1) * l;  % Rb/Sr age of the sample

fprintf('Slope (m) = %f\n', m); % slope
fprintf('age (t) = %f\n', t);   % age

plot(x,y,'o',x,f,'-')
legend('data','linear fit')