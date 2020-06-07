%Odpowiedź impulsowa


U = zeros(50,1);
U(1) = 1;

figure(1)
hold on;
theta = [1 2 0.3 0.2];
Y = imp(U,theta);
plot(Y)
theta = [3 1 0.1 0.5];
Y = imp(U,theta);
plot(Y)
theta = [5 1 0.4 0.5];
Y = imp(U,theta);
plot(Y)
grid on;
title("Odpowiedź impulsowa w zależności od wektora theta")
xlabel("Czas")
ylabel("Odpowiedź")
legend("theta = [1, 2, 0.3, 0.2]","theta = [3, 1, 0.1, 0.5]","heta = [5, 1, 0.4, 0.5]");