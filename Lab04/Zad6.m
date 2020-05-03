%Bład empiryczny szacowanej dystrybuanty 
clear all;
close all;
S = 5;
L = 1000;
mu = 1;
sigma = 1;

L = 10:10:100;

figure(1)
hold on;
grid on;
title("Realizacje błędu empirycznego w funkcji od L")
xlabel("L")
ylabel("Błąd")
xlim([0,100])
for i=1:length(L)
    for j=1:10
        e(j) = empError(L(i),S,S,mu,sigma);
        plot(L(i),e,"o")
    end
    s(i) = std(e);
end
figure(2)
grid minor;
plot(L,s)
title("Odchylenie standardowe błędu empirycznego")
xlabel("L")
ylabel("Odchylenie standardowe błędu")

S = 5:5:1000;
L = 1;
Sgen = 5;
xn = -10:1/Sgen:10;
for i = 1:length(xn)
    F(i) = normrnd(mu,sigma); 
end
for i=1:length(S)
        xm = -10:1/S(i):10;
        sum(i) = 0;
        for k=1:length(xm)
            sum(i)= sum(i) + (empValue(F,xm(k))-normDistvalue(xm(k),1,1))^2;
        end
        sum(i) = sum(i) / length(xm);
end

figure(3)
hold on;
grid on;
title("Realizacje błędu empirycznego w funkcji od M")
xlabel("M")
ylabel("Błąd")
xlim([0,20000])
plot(S*20,sum)
