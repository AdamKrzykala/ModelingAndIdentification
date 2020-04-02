close all;
clear;

n = 1000000;
r = sqrt(2/pi);

f=@(x)( sqrt(r*r - x*x) );

j = 1;

for i = 1:1:n
   
       u1 = unifrnd(-r,r);
       u2 = unifrnd(0,r);
       
       if u1 > -r && u1 <= r
           
           if u2 <= f(u1) 
           
               x(j) = u1;
               j= j +1;
           end
       end
end

figure(1);
subplot(2,1,1)
histogram(x,100);
grid minor;
title('Histogram o podanej gestosci');
xlabel('Wartosci wygenerowanych liczb');
ylabel('Ilosc wygenerowanych liczb');
xlim([-1 1]);
subplot(2,1,2)
ksdensity(x)
grid minor;
title('Funkcja gêstoœci wygenerowanych zmiennych losowych');
xlabel('Wartosci wygenerowanych liczb');
ylabel('Prawdopodobieñstwo');
xlim([-1 1]);