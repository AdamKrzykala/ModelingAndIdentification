close all;
clear all;
a = 4;
N = 10000;
X = zeros(N,1);
Z = zeros(N,1);
Y = zeros(N,1);
for i=1:N
    X(i) = unifrnd(-pi,pi);
    Z(i) = normrnd(0,1);
    Y(i) = m(X(i),a) + Z(i);
end 


x = -3:0.01:3;
y = zeros(length(x),1);
yestym1 = zeros(length(x),1);

for i=1:length(x)
    yestym1(i) = estymM(X,Y,x(i),"cos",60);
    y(i) = m(x(i),a);
end

figure(1)
title("Optymalna estymacja funkcji regresji")
hold on;
grid on;
plot(x,yestym1)
plot(x,y, "LineWidth", 2)
xlabel("Wejście")
ylabel("Wyjście")
legend("Estymacja","Charakterystyka m()")