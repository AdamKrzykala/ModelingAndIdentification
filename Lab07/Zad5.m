close all;
clear all;
a = 1;
N = 10000;
X = zeros(N,1);
Z = zeros(N,1);
Y = zeros(N,1);
for i=1:N
    X(i) = unifrnd(-pi,pi);
    Z(i) = normrnd(0,1);
    Y(i) = m(X(i),a) + Z(i);
end 

L = 1:5:300;
valid = zeros(length(L),1);
for i=1:length(L)
    L(i)
    valid(i) = errorEstym(L(i),100,"cos",X,Y,a)
end

[Ymin, Xmin] = min(valid);
minError = Ymin
minL = L(Xmin)

figure(1)
grid on;
plot(L,valid)
title("Wpływ parametru L na błąd estymacji")
xlabel("Parametr L")
ylabel("Błąd estymacji")