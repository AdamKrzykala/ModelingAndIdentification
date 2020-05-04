clear all;
close all;
%Jądrowy estymator gęstości 
% KernelDensityEstimate(population,minArg,maxArg,step,hN,type)
A = normrnd(1,1,[1,100000]);
%[y,x] = KernelDensityEstimate(A,-2,4,0.01,0.2,"Boxcar");
pd = makedist('Normal','mu',1,'sigma',1);
xNorm = -2:0.01:4;
yNorm = pdf(pd,xNorm);

figure(1)
grid on;
hold on;
[y,x] = KernelDensityEstimate(A,-2,4,0.01,0.04,"Boxcar");
plot(x,y)
[y,x] = KernelDensityEstimate(A,-2,4,0.01,0.2,"Boxcar");
plot(x,y)
[y,x] = KernelDensityEstimate(A,-2,4,0.01,0.6,"Boxcar");
plot(x,y)
plot(x,yNorm)
title("Estymatory funkcji gęstości w zależności od parametru wygładzania")
xlabel("x")
ylabel("d(x)")
legend("hN = 0.04","hN = 0.2","hN = 0.6","wzorcowy")
