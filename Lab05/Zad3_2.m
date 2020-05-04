%Różne funkcje jądra - rozkład trójkątny
clear all;
close all;
% KernelDensityEstimate(population,minArg,maxArg,step,hN,type)
for i = 1:10000
   A(i) = sqrt(unifrnd(0,1)); 
end

figure(1)
grid on;
hold on;

[y,x] = KernelDensityEstimate(A,-1,2,0.01,0.08,"Boxcar");
subplot(2,2,1);
hold on;
grid minor;
plot(x,y)
for i=1:length(x)
   yNorm(i) = triangFunction(x(i)); 
end
plot(x,yNorm)
title("Boxcar")
xlabel("x")
ylabel("d(x)")

[y,x] = KernelDensityEstimate(A,-1,2,0.01,0.08,"Gaussian");
subplot(2,2,2);
hold on;
grid minor;
plot(x,y)
for i=1:length(x)
   yNorm(i) = triangFunction(x(i)); 
end
plot(x,yNorm)
title("Gaussian")
xlabel("x")
ylabel("d(x)")

[y,x] = KernelDensityEstimate(A,-1,2,0.01,0.08,"Epanechnikov");
subplot(2,2,3)
hold on;
grid minor;
plot(x,y)
for i=1:length(x)
   yNorm(i) = triangFunction(x(i)); 
end
plot(x,yNorm)
title("Epanechnikov")
xlabel("x")
ylabel("d(x)")

[y,x] = KernelDensityEstimate(A,-1,2,0.01,0.08,"Tricube");
subplot(2,2,4)
hold on;
grid minor;
plot(x,y)
for i=1:length(x)
   yNorm(i) = triangFunction(x(i)); 
end
plot(x,yNorm)
title("Tricube")
xlabel("x")
ylabel("d(x)")
