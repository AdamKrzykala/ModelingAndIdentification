%Błąd empiryczny estymacji funkcji gęstości 
%Rozkład normalny
clear all;
close all;
% KernelDensityEstimate(population,minArg,maxArg,step,hN,type)
Sum = 0;
L = 10;
X = 0.05:0.01:0.35;

empErr = zeros(length(X),1);
A = zeros(10000,1);

mu = 1;
sigma = 1;
xNorm = -2:0.01:4;
pd = makedist('Normal','mu',mu,'sigma',sigma);
yNorm = pdf(pd,xNorm);

for k=1:length(X)
    Sum = 0;
    for l=1:L
        for i = 1:length(A)
            A(i) = normrnd(mu,sigma); 
        end
        [y,x] = KernelDensityEstimate(A,-3,4,0.1,X(k),"Gaussian");
        sum = 0;
        M = length(x);
        for j=1:M
            sum = sum + (y(j) - normpdf(x(j),mu,sigma))^2; 
        end
        Sum = Sum + sum/M;
    end
    k
    empErr(k) = Sum / L;
end
errmin =min(empErr)
hminIdx = find(empErr == min(empErr(:)))
hmin = X(hminIndex)

figure(1)
grid minor;
plot(X,empErr)
title("Wpływ parametru wygładzania na błąd empiryczny")
xlabel("Parametr wygładzania hN")
ylabel("Wartość błędu empirycznego")
[y,x] = KernelDensityEstimate(A,-2,4,0.01,X(hminIdx),"Gaussian");
figure(2)
hold on;
grid on;
plot(x,y)
plot(xNorm,yNorm)
title("Estymowana funkcja gęstości z najlepszym parametrem");
xlabel("x")
ylabel("d(x)")
