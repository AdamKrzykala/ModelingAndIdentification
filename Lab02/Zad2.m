close all;
clear;

n = 100000;
c = 50/99;
d = 1;

f1 = @(x)(50);
f2 = @(x)(c);

j = 1;

for i = 1:1:n
   
       u1 = unifrnd(0,1);
       u2 = unifrnd(0,d);
       
       if u1 > 0 && u1 <= 1/100
           
           if u2 <= f1(u1) 
           
               x(j) = u1;
               j= j + 1;
           end
           
       elseif u1 > 1/100 && u1 <= 1
           
           if u2 <= f2(u1) 
           
               x(j) = u1;
               j= j + 1;
           end
       end
end

figure(1);
hold on;
grid on;

histogram(x,100);
title('Histogram o podanej gestosci');
xlabel('Wartosci wygenerowanych liczb');
ylabel('Ilosc wygenerowanych liczb');
xlim([0,1]);
