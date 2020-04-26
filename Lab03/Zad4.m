clear all;
close all;
%Estymator kowariancji i korelacji 
%Zależność liniowa X2 = aX1 + b
a = 4;
b = 3.2;
N = 1:100:10000;

for j=1:length(N)
   for i=1:N(j)
       
        X1(i) = unifrnd(0,1); 
        X2(i) = a*X1(i) + b;
   end
   R(j) = correlation(X1,X2);
end
figure(1)
plot(N,R);
grid minor;
ylim([-1.1,1.1]);
title("Estymator korelacji w funkcji N");
xlabel("Liczebność populacji N");
ylabel("Wartość estymatora współczynnika korelacji");

%Zależność kwadratowa X2 = X1^2

for j=1:length(N)
   for i=1:N(j)
       X3(i) = normrnd(0,1); 
       X4(i) = X3(i)^2;
   end
   K(j) = correlation(X3,X4);
end

figure(2)
plot(N,K);
grid minor;
title("Estymator korelacji w funkcji N");
xlabel("Liczebność populacji N");
ylabel("Wartość estymatora współczynnika korelacji");