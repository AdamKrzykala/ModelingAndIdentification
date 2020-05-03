%Wariancja dystrybuanty empirycznej 
clear all;
close all;
S = 5;
xk1 = -10:1/S:10;
length(xk1)
for k=1:length(xk1)
    N1(k) = normDistvalue(xk1(k),1,1)*(1-normDistvalue(xk1(k),1,1));
    N1(k) = N1(k)/length(xk1);
end
S = 10;
xk2 = -10:1/S:10;
length(xk2)
for k=1:length(xk2)
    N2(k) = normDistvalue(xk2(k),1,1)*(1-normDistvalue(xk2(k),1,1));
    N2(k) = N2(k)/length(xk2);
end
S = 20;
xk3 = -10:1/S:10;
length(xk3)
for k=1:length(xk3)
    N3(k) = normDistvalue(xk3(k),1,1)*(1-normDistvalue(xk3(k),1,1));
    N3(k) = N3(k)/length(xk3);
end
S = 300;
xk4 = -10:1/S:10;
length(xk4)
for k=1:length(xk4)
    N4(k) = normDistvalue(xk4(k),1,1)*(1-normDistvalue(xk4(k),1,1));
    N4(k) = N4(k)/length(xk4);
end
figure(1)
hold on;
grid on;
plot(xk1,N1)
plot(xk2,N2)
plot(xk3,N3)
plot(xk4,N4)
title("Zależność wariancji dystrybuanty empirycznej")
xlabel("x")
ylabel("Var{F(x)}")
legend("N = 100", "N = 200", "N = 400","N = 6000") 