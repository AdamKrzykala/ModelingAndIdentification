close all;
clear all;
a = 1;
N = 10000;
X = zeros(N,1);
Z = zeros(N,1);
Y = zeros(N,1);
m_param = 0;
lambda = 0.1;
for i=1:N
    X(i) = unifrnd(-pi,pi);
    Z(i) = m_param + lambda*tan(pi*(unifrnd(0,1)-1/2));
    Y(i) = m(X(i),a) + Z(i);
end 

L = 10;
x = -3:0.01:3;
y = zeros(length(x),1);
yestym1 = zeros(length(x),1);

for i=1:length(x)
    yestym1(i) = estymM(X,Y,x(i),"cos",L);
    y(i) = m(x(i),a);
end

errorEstym(L,100,"cos",X,Y,a)

figure(1)
title("Optymalna estymacja funkcji regresji")
hold on;
grid on;
plot(x,yestym1)
plot(x,y, "LineWidth", 2)
xlabel("Wejście")
ylabel("Wyjście")
legend("Estymacja","Charakterystyka m()")