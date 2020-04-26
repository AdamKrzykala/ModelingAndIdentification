clear all;
close all;

L = 30;
N = 5:1:30;
mu = 2;
sigma = 2;
emp1 = 0;
emp2 = 0;

for j=1:length(N)
    emp1 = 0;
    emp2 = 0;
    for i=1:L
        [ex,s,S] = estym(mu,sigma,N(j));
        emp1 = emp1 + (s - sigma^2)^2;
        emp2 = emp2 + (S - sigma^2)^2;
    end
    T(j) = emp1/L;
    U(j) = emp2/L;
end
figure(1)
hold on;
plot(N,T) 
plot(N,U) 
xlim([5,30])
grid on;
title("Zależność błędu empirycznego estymatora nieobciążonego i obciążonego wariancji od rozmiaru populacji")
xlabel("Liczebność populacji N")
ylabel("Błąd empiryczny")
legend("Estymator obciążony", "Estymator nieobciążony")