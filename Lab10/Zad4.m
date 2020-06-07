clear all;
close all;
%Definicja systemu SISO
b = [3 5 1 9 3 7];
s = 5;
L = 100;

N = 100:100:1000;
err = zeros(length(N),1);
for i=1:length(N)
    N(i)
    err(i) = errGLSskor(b,N(i),L,s);
end

figure(1)
grid on;
title("Zależność błędu estymacji od ilości pomiarów")
plot(N,err)
grid on;
xlabel("N")
ylabel("Błąd estymatora")