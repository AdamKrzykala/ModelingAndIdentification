close all;
clear all;

%Generowanie sygnału wejściowego Xn
for i=1:10000
   X(i) = unifrnd(-2,2); 
end

%Generowanie sygnału zakłocającego o charakterze białego szumu
for i=1:10000
   Z(i) = normrnd(0,1); 
end

figure(1)
hold on;
grid minor;
histogram(X,"FaceColor","none","EdgeColor","blue","LineWidth",1)
histogram(Z,"FaceColor","none","EdgeColor","red","LineWidth",2,"LineStyle","--")
legend("Histogram sygnału wejściowego","Histogram zakłócenia")
title("Histogram wygenrowanych populacji sygnałów")
xlabel("Próbka")
ylabel("Ilość")