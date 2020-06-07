%Błąd
L = 100;
theta = [2,0.5];

N = 100:100:10000;
err = zeros(length(N),1);
for n=1:length(N)
    N(n)
   err(n) = errMNK(theta,L,N(n)); 
end

figure(1)
plot(N,err)
grid on;
title("Zależność błędu estymatora MNK od N w systemie ARMA");
xlabel("X")
ylabel("Błąd")
