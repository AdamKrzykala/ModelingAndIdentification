clear all;
close all;
D = 20;
mu = 0;
sigma = 1;
mu = ones(1,D)*mu;
N = 10;

sigma = eye(D)*sigma;
rng('default')  % For reproducibility
X = mvnrnd(mu,sigma,N);
a = [1,4,7,3,2,6,1,9,3,2,1,5,4,7,4,3,9,0,1,2];
