%Różne funkcje jądra - rozkład jednostajny
clear all;
close all;
% KernelDensityEstimate(population,minArg,maxArg,step,hN,type)
for i = 1:10000
   A(i) = unifrnd(0,1); 
end

figure(1)
grid on;
hold on;

[y,x] = KernelDensityEstimate(A,-1,2,0.01,0.02,"Boxcar");
subplot(2,2,1);
hold on;
grid minor;
plot(x,y)
for i=1:length(x)
   yNorm(i) = uniFunction(x(i)); 
end
plot(x,yNorm)
title("Boxcar")
xlabel("x")
ylabel("d(x)")

[y,x] = KernelDensityEstimate(A,-1,2,0.01,0.02,"Gaussian");
subplot(2,2,2);
hold on;
grid minor;
plot(x,y)
for i=1:length(x)
   yNorm(i) = uniFunction(x(i)); 
end
plot(x,yNorm)
title("Gaussian")
xlabel("x")
ylabel("d(x)")

[y,x] = KernelDensityEstimate(A,-1,2,0.01,0.02,"Epanechnikov");
subplot(2,2,3)
hold on;
grid minor;
plot(x,y)
for i=1:length(x)
   yNorm(i) = uniFunction(x(i)); 
end
plot(x,yNorm)
title("Epanechnikov")
xlabel("x")
ylabel("d(x)")

[y,x] = KernelDensityEstimate(A,-1,2,0.01,0.02,"Tricube");
subplot(2,2,4)
hold on;
grid minor;
plot(x,y)
for i=1:length(x)
   yNorm(i) = uniFunction(x(i)); 
end
plot(x,yNorm)
title("Tricube")
xlabel("x")
ylabel("d(x)")
