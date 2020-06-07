clear all;
close all;
%Definicja systemu SISO
b = [3 5 1 9 3 7];
s = 5;
L = 100;

N = 100:100:2000;
for i=1:length(N)
    N(i)
    [err(i), errSkor(i), errSkorBLUE(i)] = errComp(b,N(i),L,s)
end

figure(1)
hold on;
plot(N,err)
plot(N,errSkor)
plot(N,errSkorBLUE,"*")
grid on;
title("Trzy przypadki estymowanego wektora parametrów w zależności od N")
xlabel("N")
ylabel("Błąd")
legend("Estymator MNK, nieskorelowane Zn","Estymator MNK, skorelowane Zn","Estymator GLS, skorelowane Zn")
