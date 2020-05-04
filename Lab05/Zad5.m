%Minimalizacji funkcjonału jakości
close all;
clear all;

A = unifrnd(0,1,[1,10000]);

hN = 0.01:0.01:0.1;
y = zeros(1,length(hN));
for h=1:length(hN)
    y(h) = JhN(A,hN(h),-1,2) 
    h
end
hminIdx = find(y == min(y(:)));
hmin = hN(hminIdx)
figure(1)
grid on;
plot(hN,y)
title("Funkcjonał jakości")
xlabel("Parametr wygładzania hN")
ylabel("Wartość funkcjonału J(x)")
