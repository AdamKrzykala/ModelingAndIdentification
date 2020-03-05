%Generator liczb z rozk³adu o zadanej funkcji gêstosci
R = unifrnd(0,1);
n = 1000000;
F = 1:1:n;
for i = 1:n
   F(i) = sqrt(unifrnd(0,1)); 
end
plot(F)
histogram(F,100)