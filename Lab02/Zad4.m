close all;
clear;

n = 100000;
e = 2.718281828459;
c = sqrt( (2 * e) / pi );

j = 1;
v = Generator_LAP(n);
for i = 1:1:n
       u = unifrnd(0,1);
       if (abs(v(i)) - 1)^2 <= -2 * log(u)
           x(j) = v(i);
           j = j + 1;
       end
end

figure(1);
subplot(1,2,1)
histogram(x,100);
grid minor;
title('Histogram o podanej gestosci');
xlabel('Wartosci wygenerowanych liczb');
ylabel('Ilosc wygenerowanych liczb');
subplot(1,2,2)
ksdensity(x)
grid minor;
title('Funkcja gêstoœci wygenerowanego zestawu liczb');
xlabel('Wartosci wygenerowanych liczb');
ylabel('Prawdopodobieñstwo');
figure(2)
subplot(1,2,1)
qqplot(x)
grid minor;
subplot(1,2,2)
histfit(x)
grid minor;
title("Histogram wraz ze wzorcow¹ funkcj¹ gêstoœci")
xlabel('Wartosci wygenerowanych liczb');
ylabel('Ilosc wygenerowanych liczb');