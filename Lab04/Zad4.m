clear all;
close all;
importedData = importdata("ModelowanieLab4Data.txt");
figure(1)
histogram(importedData);

S = 10;
xk = -10:1/S:10;
for k=1:length(xk)
    K(k) = empValue(importedData,xk(k));
    N1(k) = normDistvalue(xk(k),1,1);
    N2(k) = normDistvalue(xk(k),0,5);
    C(k) = cauchyDistvalue(xk(k),0,1);
end

figure(2)
hold on;
stairs(xk,K)
plot(xk,N1)
plot(xk,N2)
plot(xk,C)
grid minor;
xlim([-10,10])
title("Dystrybuanta empiryczna wygenerowanej populacji")
xlabel("x")
ylabel("F(x)")
legend("Dystrybuanta empiryczna","N(1,1)","N(0,5)","Cauchy(0,1)")