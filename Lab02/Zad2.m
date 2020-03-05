%Generator liczb z rozk³adu jednostajnego
n = 1000000;
F = 1:1:n;
for i = 1:n
   R = unifrnd(0,1);
   if R <= 1/2
        F(i) = -1 + sqrt(1-2*(1/2-R));
   end
   if R > 1/2
        F(i) = 1 - sqrt(1-2*(-1/2+R));
   end
end
plot(F)
histogram(F,100)