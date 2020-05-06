clear all;
close all;

n = 500;
%Generowanie sygnału wejściowego Xn
for i=1:n
   X(i) = unifrnd(-2,2); 
end

m = 0;
lambda = 1;
%Generowanie sygnału zakłocającego o charakterze białego szumu
for i=1:n
   Z(i) = m+lambda*tan(pi*(rand()-1/2)); 
end

%Generowanie sygnału wyjściowego Yn
a = 2;

for i=1:n
   Y(i) = atan(a*X(i)) + Z(i);
end

X_base = -2:0.01:2;
figure(2)
hold on;
grid on;

subplot(2,2,1)
hold on;
grid on;
[y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,0.7,"Boxcar");
plot(x,y)
plot(X_base,atan(a*X_base),"LineWidth",2)
title("Boxcar")
xlabel("x")
ylabel("y")
legend("Estymator","Charakterystyka")
ylim([-1.5,1.5])

subplot(2,2,2)
hold on;
grid on;
[y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,0.31,"Gaussian");
plot(x,y)
plot(X_base,atan(a*X_base),"LineWidth",2)
title("Gaussian")
xlabel("x")
ylabel("y")
legend("Estymator","Charakterystyka")
ylim([-1.5,1.5])


subplot(2,2,3)
hold on;
grid on;
[y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,0.74,"Epanechnikov");
plot(x,y)
plot(X_base,atan(a*X_base),"LineWidth",2)
title("Epanechnikov")
xlabel("x")
ylabel("y")
legend("Estymator","Charakterystyka")
ylim([-1.5,1.5])


subplot(2,2,4)
hold on;
grid on;
[y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,0.87,"Tricube");
plot(x,y)
plot(X_base,atan(a*X_base),"LineWidth",2)
title("Tricube")
xlabel("x")
ylabel("y")
legend("Estymator","Charakterystyka")
ylim([-1.5,1.5])

