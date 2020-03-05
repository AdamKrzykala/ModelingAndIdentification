%Generator liczb pseudolosowych z rozk³adu jednostajnego
%oparty na przekszta³ceniu pi³okszta³tnym 
%-----------------------------------------
%Analiza podstawowych w³asnoœci algorytmu.
X0 = 0.9;
%Iloœæ wygenerowanych liczb
n = 500000;
X = 1:1:n;
X(1) = X0;
z = 1.555;
for i = 1:(n-1)
   X(i+1) = X(i)*z - floor(X(i))*z;
end

figure(1)
plot(X)
figure(2)
histogram(X,100)
%------Wp³yw punktu pocz¹tkowego 
%Parametr X0 wp³ywa na przesuniêcie fazowe wygenerowanych liczb
%------Wp³yw parametru z
%Z ma wartoœæ minimum 1
%Zwiêkszanie z zmniejsza okres i prowadzi do zwiêkszenia pseudolosowoœci 
%Liczby losowane s¹ w granicach (0,z)
%------Okres generatora to d³ugoœæ ci¹gu niepowtarzaj¹cych siê liczb.
%Dla z = 1.0001 ok. 92000, dla z = 1.001 ok. 8200
%------Podobieñstwo do funkcji gêstoœci rozk³adu jednostajnego
%Zwiêkszanie iloœci próbek powoduje, ¿e histogram zbli¿a siê ksza³tem
%do funkcji gêstoœci rozk³adu jednostajnego, co oznacza, ¿e
%szansa na wylosowanie danej liczny z przedzia³u (0,z) jest taka sama jak
%ka¿dej innej z tego przedzia³u.


