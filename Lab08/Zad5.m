%Estymator najmniejszych kwadratów - błąd

clear all;
close all;
D = 20;
mu = 0;
sigmaX = 1;

a = [1,4,7,3,2,6,1,9,3,2,1,5,4,7,4,3,9,0,1,2];
L = 20;

N = 100:100:3000;
SigmaZ = [0.5 1 2];
figure(1)
title("Zależność błędu estymatora MNK od ilości pomiarów")
hold on;
grid on;
for j=1:length(SigmaZ)
   for i=1:length(N)
        N(i)
        err(i) = errMNK(N(i),D,mu,sigmaX,SigmaZ(j),a,L);
   end 
   plot(N,err);
end
xlabel("N")
ylabel("Błąd")
legend("sigma = 0.5","sigma = 1","sigma = 2")

