%Generator liczb z rozkładu normalnego 
%N(1,1)
clear all;
close all;
A = normrnd(1,1,[1,10000]);
figure(1)
histogram(A)
title("Histogram wygenerowanych próbek N = 10 000")
xlabel("Próbka")
ylabel("Ilość")
mean(A)
std(A)