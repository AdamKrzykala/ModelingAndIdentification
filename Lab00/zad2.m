%Implementacja generatora liczb pseudolosowych bazuj�cego na
%przesz�ych pr�bkach 
% X(n+1) = (a0X(n) + a1X(n-1)+...+akX(n-k)+c)mod m
k = 4;
n = 100000;
x = 1:1:n+k;
a = [1,1,1,1,1];
x(1) = 0;
x(2) = 0;
x(3) = 0;
x(4) = 0;
x(5) = 0;
m = 200;
c = 0.0001;
for i = 5:1:n+k
   x(i+1) = (a(1)*x(i) + a(2)*x(i-1) + a(3)*x(i-2) + a(4)*x(i-3) + a(5)*x(i-4) + c);
   x(i+1) = mod(x(i+1),m);
end
figure(1)
plot(x(6:n+k))
figure(2)
histogram(x(6:n+k),200,'Normalization','probability')
title("Histogram wygenerowanych liczb")
xlabel("Warto�� pr�bki")
ylabel("Liczebno�� pr�bki")
%Warto�ci losowane w przedziale (0,m)
%c - minimalna dok�adno�� losowanych liczb
%Gdy c d��dy do zera, a liczba losowanych liczb d��y do niesko�czono�ci
%otrzymujemy rozk�ad jednostajny. 
%Warto�� oczekiwana to m/2. 
%Funkcja g�sto�ci prawdopodobie�stwa w przedziale [0,m] to 1/m