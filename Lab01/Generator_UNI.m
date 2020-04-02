function y = Generator_UNI(n)

k = 4;
x = 1:1:n+k;
a = [1,1,1,1,1];
x(1) = 0;
x(2) = 0;
x(3) = 0;
x(4) = 0;
x(5) = 0;
m = 1;
c = 0.0001;
for i = 5:1:n+k
   x(i+1) = (a(1)*x(i) + a(2)*x(i-1) + a(3)*x(i-2) + a(4)*x(i-3) + a(5)*x(i-4) + c);
   x(i+1) = mod(x(i+1),m);
end
y = x(5:n+k);
end