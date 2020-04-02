%Generator liczb z rozk³adu Laplace'a
F = 1:1:n;
y = Generator_UNI(n);
for i = 1:n
    if y(i) < 1/2
       F(i) = -log(2*y(i)); 
    end
    if y(i) >= 1/2
       F(i) = log(2-2*y(i)); 
    end
end
figure(1)
histogram(F,400,'Normalization','probability')
grid minor;
xlim([-10 10])
title("Histogram liczb wygenerowanych z zadanego rozk³adu")
xlabel("Wylosowane próbki")
ylabel("Liczebnoœæ znormalizowana")