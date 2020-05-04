%Błąd empiryczny estymacji funkcji gęstości 
%Rozkład trójkątny
clear all;
close all;
% KernelDensityEstimate(population,minArg,maxArg,step,hN,type)

Sum = 0;
L = 10;
X = 0:0.001:0.1;

empErr = zeros(length(X),1);
A = zeros(10000,1);

for k=1:length(X)
    Sum = 0;
    for l=1:L
        for i = 1:length(A)
            A(i) = sqrt(unifrnd(0,1)); 
        end
        [y,x] = KernelDensityEstimate(A,0,1,0.01,X(k),"Boxcar");
        sum = 0;
        M = length(x);
        for j=1:M
            sum = sum + (y(j) - triangFunction(x(j)))^2; 
        end
        Sum = Sum + sum/M;
    end
    k
    empErr(k) = Sum / L;
end
errmin = min(empErr)
hminIdx = find(empErr == min(empErr(:)))
hmin = X(hminIdx)

figure(1)
grid minor;
plot(X,empErr)
title("Wpływ parametru wygładzania na błąd empiryczny")
xlabel("Parametr wygładzania hN")
ylabel("Wartość błędu empirycznego")
idx = find(X==min(empErr));
[y,x] = KernelDensityEstimate(A,-1,2,0.01,X(hminIdx),"Boxcar");
figure(2)
hold on;
grid on;
plot(x,y)
xNorm = -1:0.01:2;
for i=1:length(xNorm)
   yNorm(i) = triangFunction(xNorm(i)); 
end
plot(xNorm,yNorm)
title("Estymowana funkcja gęstości z najlepszym parametrem");
xlabel("x")
ylabel("d(x)")




