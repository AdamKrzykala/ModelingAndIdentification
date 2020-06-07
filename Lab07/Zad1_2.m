a = 1;
N = 10000;
X = zeros(N,1);
Z = zeros(N,1);
Y = zeros(N,1);
for i=1:N
    X(i) = unifrnd(-pi,pi);
    Z(i) = normrnd(0,1);
    Y(i) = m(X(i),a) + Z(i);
end 

x = -pi:0.01:pi;
y = zeros(length(x),1);
for i=1:length(x)
   y(i) = m(x(i),a); 
end
figure(1)
hold on;
grid on;
plot(X,Y,"*")
plot(x,y,"LineWidth",4);
title("Rzeczywista charakterystyka systemu i pomiary wejście-wyjście")
xlabel("Wejście systemu")
ylabel("Wyjście systemu")
legend("Pary pomiarowe", "Charakterystyka systemu m()")
