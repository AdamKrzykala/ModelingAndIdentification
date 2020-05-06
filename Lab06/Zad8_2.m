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
   Z(i) = normrnd(1,1);
end

%Generowanie sygnału wyjściowego Yn
a = 2;

for i=1:n
   Y(i) = (X(i)-1)^2 + Z(i);
end

X_base = -2:0.01:2;
figure(2)
hold on;
grid on;

subplot(2,2,1)
hold on;
grid on;
[y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,0.15,"Boxcar");
plot(x,y)
plot(X_base,(X_base-1).^2,"LineWidth",2)
title("Boxcar")
xlabel("x")
ylabel("y")
legend("Estymator","Charakterystyka")
ylim([-0.5,4])

subplot(2,2,2)
hold on;
grid on;
[y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,0.09,"Gaussian");
plot(x,y)
plot(X_base,(X_base-1).^2,"LineWidth",2)
title("Gaussian")
xlabel("x")
ylabel("y")
legend("Estymator","Charakterystyka")
ylim([-0.5,4])


subplot(2,2,3)
hold on;
grid on;
[y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,0.20,"Epanechnikov");
plot(x,y)
plot(X_base,(X_base-1).^2,"LineWidth",2)
title("Epanechnikov")
xlabel("x")
ylabel("y")
legend("Estymator","Charakterystyka")
ylim([-0.5,4])


subplot(2,2,4)
hold on;
grid on;
[y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,0.23,"Tricube");
plot(x,y)
plot(X_base,(X_base-1).^2,"LineWidth",2)
title("Tricube")
xlabel("x")
ylabel("y")
legend("Estymator","Charakterystyka")
ylim([-0.5,4])

