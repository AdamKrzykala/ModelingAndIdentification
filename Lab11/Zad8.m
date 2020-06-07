%Comparison between MNK and instrumental variables

clear all;
close all;

theta = [2 0.5];
N = 10000;

N = 100:100:5000;
T = zeros(length(N),1);
TIV = zeros(length(N),1);
for i=1:length(N)
    N(i)
    [T(i),TIV(i)] = estymComp(theta,N(i),100);
end

figure(1)
hold on;
plot(N,T)
plot(N,TIV)
grid on;
title("Zbieżność błędów estymatorów systemu ARMA SISO")
xlabel("N")
ylabel("Błąd")
legend("MNK","Zmienne instrumentalne")