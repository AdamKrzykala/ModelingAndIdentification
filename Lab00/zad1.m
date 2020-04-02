clear all;
%Generator liczb pseudolosowych z rozk³adu jednostajnego
%oparty na przekszta³ceniu pi³okszta³tnym 
%-----------------------------------------
%Analiza podstawowych w³asnoœci algorytmu.
X01 = 1.45;
X02 = 1.55;
X03 = 1.65;
X04 = 1.90;
X05 = 1.95;
%Iloœæ wygenerowanych liczb
n = 10;
X1 = 1:1:n;
X2 = 1:1:n;
X3 = 1:1:n;
X4 = 1:1:n;
X5 = 1:1:n;
X1(1) = X01;
X2(1) = X02;
X3(1) = X03;
X4(1) = X04;
X5(1) = X05;
z = 3;
for i = 1:(n-1)
   X1(i+1) = X1(i)*z - floor(X1(i)*z);
   X2(i+1) = X2(i)*z - floor(X2(i)*z);
   X3(i+1) = X3(i)*z - floor(X3(i)*z);
   X4(i+1) = X4(i)*z - floor(X4(i)*z);
   X5(i+1) = X5(i)*z - floor(X5(i)*z);
end

figure(1);
subplot(1,2,1)
hold on;
grid on;
plot(X1(2:n));
plot(X2(2:n));
title('Wp³yw parametru X0 na losowane liczby');
legend("X0 = 1.45","X0 = 1.55");
xlabel('Krok');
ylabel('Wygenerowana liczba');
subplot(1,2,2)
hold on;
grid on;
plot(X3(2:n));
plot(X4(2:n));
plot(X5(2:n));
title('Wp³yw parametru X0 na losowane liczby');
legend("X0 = 1.65","X0 = 1.90","X0 = 1.95");
xlabel('Krok');
ylabel('Wygenerowana liczba');

%Wp³yw parametru z
%Generator naprzemienny z dwoma wartoœciami wyjœciowymi
n = 21;
X06 = 1.25;
X6 = 1:1:n;
X6(1) = X06;
z = 3;
for i = 1:(n-1)
   X6(i+1) = X6(i)*z - floor(X6(i)*z);
end
figure(2)
subplot(1,2,1)
histogram(X6(2:n),100)
grid minor;
title("Histogram wygenerowanych liczb")
xlabel("Wygenerowana liczba")
ylabel("Iloœæ próbek")
subplot(1,2,2)
plot(X6(2:n))
grid on;
title("Generowane liczby")
xlabel("Krok")
ylabel("Wygenerowana liczba")

n = 21;
X07 = 1.85;
X7 = 1:1:n;
X7(1) = X07;
z = 3;
for i = 1:(n-1)
   X7(i+1) = X7(i)*z - floor(X7(i)*z);
end
figure(3)
subplot(1,2,1)
histogram(X7(2:n),100)
grid minor;
title("Histogram wygenerowanych liczb")
xlabel("Wygenerowana liczba")
ylabel("Iloœæ próbek")
subplot(1,2,2)
plot(X7(2:n))
grid on;
title("Generowane liczby")
xlabel("Krok")
ylabel("Wygenerowana liczba")

n = 21;
X08 = 1.85;
X8 = 1:1:n;
X8(1) = X08;
z = 5;
for i = 1:(n-1)
   X8(i+1) = X8(i)*z - floor(X8(i)*z);
end
figure(4)
subplot(1,2,1)
histogram(X8(2:n),100)
grid minor;
title("Histogram wygenerowanych liczb")
xlabel("Wygenerowana liczba")
ylabel("Iloœæ próbek")
subplot(1,2,2)
plot(X8(2:n))
grid on;
title("Generowane liczby")
xlabel("Krok")
ylabel("Wygenerowana liczba")

n = 100000;
X09 = 1.95;
X9 = 1:1:n;
X9(1) = X09;
z = 3333;
for i = 1:(n-1)
   X9(i+1) = X9(i)*z - floor(X9(i)*z);
end
%Podobieñstwo do gêstoœci prawdopodobieñstwa
%Normowanie histogramu
figure(5)
subplot(1,2,1)
histogram(X9(2:n),100,'Normalization','probability')
grid minor;
title("Histogram wygenerowanych liczb")
xlabel("Wygenerowana liczba")
ylabel("Iloœæ próbek")
subplot(1,2,2)
plot(X9(2:n))
grid on;
title("Generowane liczby")
xlabel("Krok")
ylabel("Wygenerowana liczba")