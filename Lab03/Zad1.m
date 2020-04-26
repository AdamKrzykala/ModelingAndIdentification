clear all;
close all;
%Generator liczb z rozkladu normalnego 
%r = normrnd(mu,sigma)

mu = 1;         %Expected value
sigma = 2;       %Std
N = 10000;      %Number of samples
for i = 1:N
    T(i) = normrnd(mu,sigma);
end
figure(1)
histfit(T)
title("Populacja z rozkładu N(1,2)")
xlabel("Zmienna losowa")
ylabel("Liczebność")

%Estymator wartości oczekiwanej 
Ex = 0;
for i = 1:N
    Ex = Ex + T(i);
end
Ex = Ex/N

%Obciążony estymator wariancji
BiasVar = 0;
for i = 1:N
    BiasVar = BiasVar + (T(i) - mu)^2;
end
BiasVar = BiasVar/N

%Obciążony estymator wariancji
UnBiasVar = 0;
for i = 1:N
    UnBiasVar = UnBiasVar + (T(i) - mu)^2;
end
UnBiasVar = UnBiasVar/(N-1)
