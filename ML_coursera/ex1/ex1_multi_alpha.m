clear ; close all; clc

fprintf('Loading data ...\n');


%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);


[Xt mu sigma] = featureNormalize(X);

% Add intercept term to X
Xt = [ones(m, 1) Xt];


fprintf('Running gradient descent ...\n');

% Choose some alpha value
% multiGo(Xt, y, mu, sigma, 0.01, '-b');
% multiGo(Xt, y, mu, sigma, 0.03, '-r');
% multiGo(Xt, y, mu, sigma, 0.06, '-g');
% multiGo(Xt, y, mu, sigma, 0.1, '-c');
% multiGo(Xt, y, mu, sigma, 0.3, '-c', 50);
multiGo(Xt, y, mu, sigma, 1.2, '-m', 50);

pause;
