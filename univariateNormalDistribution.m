x = [-100:100]
mu = 0;
sigma = 1;

temp1 = (x - mu).^2
temp2 = -temp1/(2*(sigma)^2)
temp3 = exp(temp2)
temp4 = temp3/(2*sigma*sigma*pi)^(1/2)

y = temp4

figure(1)
plot(x,y)
