%Estymator najmniejszych kwadratów

clear all;
close all;
D = 20;
mu = 0;
sigmaX = 1;
sigmaZ = 1;
mu = ones(1,D)*mu;
N = 100000;

sigma = eye(D)*sigmaX;
rng('default')  % For reproducibility
X = mvnrnd(mu,sigma,N);
a = [1,4,7,3,2,6,1,9,3,2,1,5,4,7,4,3,9,0,1,2];

Z = zeros(N,1);
for i=1:length(Z)
   Z(i) = normrnd(0,sigmaZ); 
end

Y = X * a' + Z;

estymA = (X'*X)^(-1)*X'*Y;