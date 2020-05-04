%Różne funkcje jądra - rozkład normalny
clear all;
close all;
% KernelDensityEstimate(population,minArg,maxArg,step,hN,type)
A = normrnd(1,1,[1,10000]);
pd = makedist('Normal','mu',1,'sigma',1);
xNorm = -2:0.01:4;
yNorm = pdf(pd,xNorm);

figure(1)
grid on;
hold on;

[y,x] = KernelDensityEstimate(A,-2,4,0.01,0.2,"Boxcar");
subplot(2,2,1);
hold on;
grid minor;
plot(x,y)
plot(x,yNorm)
title("Boxcar")
xlabel("x")
ylabel("d(x)")

[y,x] = KernelDensityEstimate(A,-2,4,0.01,0.2,"Gaussian");
subplot(2,2,2);
hold on;
grid minor;
plot(x,y)
plot(x,yNorm)
title("Gaussian")
xlabel("x")
ylabel("d(x)")

[y,x] = KernelDensityEstimate(A,-2,4,0.01,0.2,"Epanechnikov");
subplot(2,2,3)
hold on;
grid minor;
plot(x,y)
plot(x,yNorm)
title("Epanechnikov")
xlabel("x")
ylabel("d(x)")

[y,x] = KernelDensityEstimate(A,-2,4,0.01,0.2,"Tricube");
subplot(2,2,4)
hold on;
grid minor;
plot(x,y)
plot(x,yNorm)
title("Tricube")
xlabel("x")
ylabel("d(x)")
