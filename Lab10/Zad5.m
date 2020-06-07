clear all;
close all;

N = 10;
r = zeros(N,1);
r(1) = 1.25;
r(2) = 0.5;
R = toeplitz(r);
det(R)