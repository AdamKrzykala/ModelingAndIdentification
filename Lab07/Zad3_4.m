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


x = -3:0.05:3;
y = zeros(length(x),1);
yestym1 = zeros(length(x),1);
yestym2 = zeros(length(x),1);
yestym3 = zeros(length(x),1);
yestym4 = zeros(length(x),1);
for i=1:length(x)
    yestym1(i) = estymM(X,Y,x(i),"cos",3);
    yestym2(i) = estymM(X,Y,x(i),"cos",10);
    yestym3(i) = estymM(X,Y,x(i),"cos",20);
    yestym4(i) = estymM(X,Y,x(i),"cos",100);
    y(i) = m(x(i),a);
end

figure(1)
title("Wpływ parametru L na estymator ortogonalny")
hold on;
grid on;
subplot(2,2,1)
hold on
grid on
plot(x,yestym1)
plot(x,y, "LineWidth", 2)
title("L = 3")
xlabel("Wejście")
ylabel("Wyjście")
subplot(2,2,2)
hold on
grid on
plot(x,yestym2)
plot(x,y, "LineWidth", 2)
title("L = 10")
xlabel("Wejście")
ylabel("Wyjście")
subplot(2,2,3)
hold on
grid on
plot(x,yestym3)
plot(x,y, "LineWidth", 2)
title("L = 20")
xlabel("Wejście")
ylabel("Wyjście")
subplot(2,2,4)
hold on
grid on
plot(x,yestym4)
plot(x,y, "LineWidth", 2)
title("L = 100")
xlabel("Wejście")
ylabel("Wyjście")