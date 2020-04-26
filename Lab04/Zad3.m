clear all;
close all;
%Dystrybuanta empiryczna
n = 100:1000:100000;

S = 30;
for i = 1:length(n)
    for j = 1:n(i)
        F(j) = sqrt(unifrnd(0,1)); 
    end
    DN(i) = 0;
    xk = 1/S:1/S:1;
    for k=1:S
        temp = empValue(F,k*1/S);
        newDn = abs(temp - (k*1/S)^2);
        if newDn > DN(i)
            DN(i) = newDn; 
        end
    end
end
figure(1)
plot(n,DN,"r")
grid minor;
title("Największy błąd wyznaczonej dystrybuanty empirycznej w funkcji N")
xlabel("Liczebność populacji N")
ylabel("Błąd")