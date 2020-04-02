%Generator liczb z rozk�adu o zadanej funkcji g�stosci
n = 1000000;
F = 1:1:n;
y = Generator_UNI(n);
for i = 1:n
   F(i) = sqrt(y(i)); 
end
figure(1)
histogram(F,100,'Normalization','probability')
grid minor;
xlim([-0.5 1.5])
title("Histogram liczb wygenerowanych z zadanego rozk�adu")
xlabel("Wylosowane pr�bki")
ylabel("Liczebno�� znormalizowanapaint")
