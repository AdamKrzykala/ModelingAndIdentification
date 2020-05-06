close all;
clear all;

n = 1000;
%Generowanie sygnału wejściowego Xn
for i=1:n
   X(i) = unifrnd(-2,2); 
end

%Generowanie sygnału zakłocającego o charakterze białego szumu
for i=1:n
   Z(i) = normrnd(0,1); 
end

%Generowanie sygnału wyjściowego Yn
a = 1;

for i=1:n
   Y(i) = atan(a*X(i)) + Z(i);
end
x = -2:0.01:2;
figure(1)
hold on;
grid on;
plot(X,Y,"o")
plot(x,atan(a*x))
title("Pary pomiarów wejścia-wyjścia obok rzeczywistej charakterystyki systemu");
xlabel("x");
ylabel("y");
legend("Punkty par pomiarowych","Rzeczywista charakterystyka nieliniowa");
