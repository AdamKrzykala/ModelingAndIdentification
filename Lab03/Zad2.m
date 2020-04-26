clear all;
close all;
%[ex,s,S] = estym(2,2,10000);

L = 10:10:30;
N = 100:500:10500;
mu = 2;
sigma = 2;
emp = 0;
figure(1)
hold on;
grid minor;
for k=1:length(L)
   for j=1:length(N)
        emp = 0;
        for i=1:L(k)
            [ex,s,S] = estym(mu,sigma,N(j));
            emp = emp + (S - sigma^2)^2;
        end
        emp = emp/L(k);
        T(j) = emp;
    end
    plot(N,T) 
end
xlim([0,10000])
title("Zależność błędu empirycznego estymatora nieobciążonego wariancji od rozmiaru populacji")
xlabel("Liczebność populacji N")
ylabel("Błąd empiryczny")
legend("L = 10", "L = 20","L = 30")