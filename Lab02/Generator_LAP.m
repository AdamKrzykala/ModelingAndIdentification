function y = Generator_LAP(n)
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
y = F;
end