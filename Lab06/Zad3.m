clear all;
close all;

n = 500;
%Generowanie sygnału wejściowego Xn
for i=1:n
   X(i) = unifrnd(-2,2); 
end

%Generowanie sygnału zakłocającego o charakterze białego szumu
for i=1:n
   Z(i) = normrnd(0,1); 
end

%Generowanie sygnału wyjściowego Yn
a = 1;

for i=1:n
   Y(i) = atan(a*X(i)) + Z(i);
end

[y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,0.5,"Boxcar");
figure(1)
hold on;
grid on;
plot(X,Y,"o")
plot(x,y)
title("Estymowana funkcja regresji metodą jądrową na tle par pomiarowych")
xlabel("x")
ylabel("y")
legend("Punkty par pomiarowych","Estymowana funkcja regresji")

hN = 0.1:0.05:0.3;
figure(2)
hold on;
grid on;
title("Estymowana funkcja regresji metodą jądrową na tle par pomiarowych")
xlabel("x")
ylabel("y")
for i=1:length(hN)
    [y,x] = KernelRegressionEstimate(X,Y,-2,2,0.01,hN(i),"Boxcar");
    plot(x,y)
end
x = -2:0.01:2;
plot(x,atan(a*x),"LineWidth",2)
legend("hN = 0.1","hN = 0.15","hN = 0.2","hN = 0.25","hN = 0.3","Charakterystyka systemu")