%Generator liczb z rozk?adu jednostajnego
n = 1000000;
F = 1:1:n;
y = Generator_UNI(n);
for i = 1:n
   if y(i) <= 1/2
        F(i) = sqrt(2*y(i))-1;
   end
   if y(i) > 1/2
        F(i) = 1 - sqrt(2-2*y(i));
   end
end
figure(1)
histogram(F,100,'Normalization','probability')
grid minor;
xlim([-1.5 1.5])
title("Histogram liczb wygenerowanych z zadanego rozk?adu")
xlabel("Wylosowane pr?bki")
ylabel("Liczebno?? znormalizowana")

