%Generator liczb z rozk³adu jednostajnego
n = 10000;
F = 1:1:n;
for i = 1:n
   R = unifrnd(0,1);
   F(i) = -log(-R+1);
end
figure(1)
plot(F)
figure(2)
histogram(F)
figure(3)
ksdensity(F)