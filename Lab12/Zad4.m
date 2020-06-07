%Konstrukcja estymatora

clear all;
close all;
lambda = [-0.5 0.6 0.1 -0.9 0.7];
c2 = 4;

N = 10:100:10000;
err = zeros(length(N),1);
for k=1:length(N)
    N(k)
    UN = unifrnd(-1,1,[N(k),1]);
    VN = zeros(N(k),1);
    for i=1:N(k)
       VN(i) = c2*atan(UN(i));
    end

    v = zeros(N(k),length(lambda));

    for i=1:length(lambda)
       for j=1:(N(k)-i+1)
          v(j+i-1,i) = VN(j); 
       end
    end
    
    err(k) = errParam(UN,lambda,v,100);
end

figure(1)
plot(N,err)
grid on;
title("Błąd estymatora w zależności od N")
xlabel("N")
ylabel("Błąd")

