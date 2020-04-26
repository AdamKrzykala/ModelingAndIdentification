clear all;
close all;
%Cauchy generator
pd = makedist('tLocationScale','mu',0,'sigma',1,'nu',1);
x = -20:1:20;
y = pdf(pd,x);

figure(1)
plot(x,y,'LineWidth',2)
grid minor;
title("Funkcja gęstości rozkładu Cauchy'ego");
xlabel("Zmienna losowa")
ylabel("Prawdopodobieństwo")

L = 30;
N = 10:10:1000;
mu = 0;
sigma = 1;
emp = 0;
figure(2)
hold on;
grid minor;
   for j=1:length(N)
        emp = 0;
        for i=1:L
            [ex,s,S] = estym_cauchy(mu,sigma,N(j));
            emp = emp + (s - sigma^2)^2;
        end
        T(j) = emp/L;
    end
    plot(N,T) 
xlim([0,1000])
title("Zależność błędu empirycznego estymatora obciążonego wariancji od rozmiaru populacji")
xlabel("Liczebność populacji N")
ylabel("Błąd empiryczny")

pd = makedist('tLocationScale','mu',mu,'sigma',sigma,'nu',1);
rng('default');  % For reproducibility
median(pd)
