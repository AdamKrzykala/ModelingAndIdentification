%Punktowa zbieżność  według rozkładu
%dystrybuanty empirycznej do rozkładu normalnego
%-----------------------------------------------
clear all;
close all;
x = 0;
N = 10000;
Fx = normDistvalue(x,0,1);

for j = 1:1000
    for i = 1:N
        F(i) = normrnd(0,1); 
    end
    empValue(F,x);
    value(j) = sqrt(N)*(empValue(F,x)-Fx);
end

xm = -3:0.01:3;
newSigma = sqrt(Fx*(1-Fx));

pd = makedist('Normal','mu',0,'sigma',newSigma);
y = pdf(pd,xm);
figure(1)
hold on;
grid minor;
title("Funkcje gęstości")
xlabel("x")
ylabel("d(x)")
ksdensity(value);
plot(xm,y);
legend("Funkcja gęstości z populacji","Wzorowa funkcja gęstości")


