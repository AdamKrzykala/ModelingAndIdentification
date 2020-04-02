%Generator liczb z rozk�adu jednostajnego
n = 1000000;
F = 1:1:n;
y = Generator_UNI(n);
for i = 1:n
   F(i) = -log(-y(i)+1);
end
figure(1)
histogram(F,100,'Normalization','probability')
grid minor;
xlim([-1 10])
title("Histogram liczb wygenerowanych z zadanego rozk�adu")
xlabel("Wylosowane pr�bki")
ylabel("Liczebno�� znormalizowana")