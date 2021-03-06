clear all;
close all;
%Dystrybuanta empiryczna
n = 100;

S = 30;

for i = 1:n
   F(i) = sqrt(unifrnd(0,1)); 
end

xk = 1/S:1/S:1;
for k=1:S
    K(k) = empValue(F,k*1/S);
end

figure(1)
hold on;
plot(xk,xk.^2)
stairs(xk,K)
grid minor;
xlim([0,1])
title("Dystrybuanta empiryczna wygenerowanej populacji")
xlabel("x")
ylabel("F(x)")
legend("Dystrybuanta wzorcowa","Dystrybuanta empiryczna")
