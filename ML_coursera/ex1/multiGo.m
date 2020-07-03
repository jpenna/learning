function multiGo(Xt, y, mu, sigma, alpha, plotFormat, num_iters = 400)

  theta = zeros(3, 1);
  [theta, J_history] = gradientDescentMulti(Xt, y, theta, alpha, num_iters);

  % Plot the convergence graph
  figure(1);
  hold on;
  plot(1:numel(J_history), J_history, plotFormat, 'LineWidth', 2);
  hold off;
  xlabel('Number of iterations');
  ylabel('Cost J');

  % Display gradient descent's result
  fprintf('\n\n------- Theta (alpha: %f) -------\n', alpha);
  fprintf(' %f \n', theta);
  fprintf('\n');

  a = [1427 3; 1650 4; 2000 4; 3000 5];

  for i = 1:size(a, 1)
    price = [ones(1,1) ((a(i,:) - mu) ./ sigma)] * theta;
    fprintf(['%d sq-ft, %d br: $%f\n'], [a(i,1) a(i,2) price]);
  end

end
