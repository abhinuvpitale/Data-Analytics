mu = [0 0];
sigma = [1 0;0 1];
x1 = [-10:1:10];
x2 = [-10:1:10];

[X1,X2] = meshgrid(x1,x2);
func = mvnpdf([X1(:) X2(:)], mu, sigma);
func = reshape(func, length(x1), length(x2))
surf(X1,X2,func)
