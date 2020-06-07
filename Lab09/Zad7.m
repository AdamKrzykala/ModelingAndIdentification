%Estymator najmniejszych kwadratów - błąd
clear all;
close all;
D = 20;
mu = 0;
sigmaX = 1;

a = [1,4,7,3,2,6,1,9,3,2,1,5,4,7,4,3,9,0,1,2];
L = 10;

N = 100:100:4000;
SigmaZ = [0.5 1 2];
figure(1)
title("Zależność błędu estymatora MNK od ilości pomiarów")
hold on;
grid on;
for j=1:length(SigmaZ)
   for i=1:length(N)
        N(i)
        [errS(i),errN(i)] = errMNK(N(i),D,mu,sigmaX,SigmaZ(j),a,L);
   end 
   plot(N,errS,"*");
   plot(N,errN);
end
xlabel("N")
ylabel("Błąd")
legend("Sigma = 0.5 (skorelowane)","Sigma = 0.5 (nieskorelowane)","Sigma = 1 (skorelowane)","Sigma = 1 (nieskorelowane)", "Sigma = 2 (skorelowane)","Sigma = 2 (nieskorelowane)");
