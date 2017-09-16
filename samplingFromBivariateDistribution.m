%script to run mvnrnd

mu = [1 0];
sigma = [1 0;0 1];

%increase the size of N to see the distribution's concentration near the
%mean
N = 1000;

mI = mvnrnd(mu,sigma,N);

figure(1)
plot(mI(:,1),mI(:,2),'o')

