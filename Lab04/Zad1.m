%Generator liczb z zaanego rozkładu
clear all;
close all;
n = 30000000;

for i = 1:n
   F(i) = sqrt(unifrnd(0,1)); 
end
figure(1)
histogram(F,100)
title("Histogram wygenerowanych liczb z zadanego rozkładu");
xlabel("Zmienna losowa");
ylabel("Liczebność próbek");

[f,xi] = ksdensity(F);

int(1) = 0;
for i=1:(length(xi)-1)
   int(i+1) = int(i) + f(i)/length(f);
end

figure(2)
plot(xi,int)
grid minor;
title("Dystrybuanta wyznaczona na podstawie wylosowanej populacji");
xlabel("x")
ylabel("F(x)")
figure(3)
plot(xi,f)
grid minor;
title("Funkcja gęstości wyznaczona na podstawie wylosowanej populacji");
xlabel("Zmienna losowa")
ylabel("Prawdopodobieństwo")