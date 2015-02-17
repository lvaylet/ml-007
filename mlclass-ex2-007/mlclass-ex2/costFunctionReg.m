function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% X = mxn matrix
% theta = nx1 column vector
h = sigmoid(X*theta); % h = mx1 column vector

% y = mx1 column vector
% log(h) = mx1 column vector
J = 1/m*sum(-y.*log(h) - (1-y).*log(1-h)); % J = scalar

% Regularize (except theta0 = theta(1))
J = J + lambda/(2*m)*sum(theta(2:end).^2);

% for example = 1:m
%     grad = grad + (h(example) - y(example)) * X(example,:)';
% end
% 
% grad = grad/m;

% Compute gradient (without regularization)
grad = 1/m * X' * (h - y);

% Regularize (except theta0)
grad(2:end) = grad(2:end) + lambda/m*theta(2:end);

% =============================================================

end
