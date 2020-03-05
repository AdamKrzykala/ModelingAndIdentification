%Generator liczb pseudolosowych z rozk�adu jednostajnego
%oparty na przekszta�ceniu pi�okszta�tnym 
%-----------------------------------------
%Analiza podstawowych w�asno�ci algorytmu.
X0 = 0.9;
%Ilo�� wygenerowanych liczb
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
%------Wp�yw punktu pocz�tkowego 
%Parametr X0 wp�ywa na przesuni�cie fazowe wygenerowanych liczb
%------Wp�yw parametru z
%Z ma warto�� minimum 1
%Zwi�kszanie z zmniejsza okres i prowadzi do zwi�kszenia pseudolosowo�ci 
%Liczby losowane s� w granicach (0,z)
%------Okres generatora to d�ugo�� ci�gu niepowtarzaj�cych si� liczb.
%Dla z = 1.0001 ok. 92000, dla z = 1.001 ok. 8200
%------Podobie�stwo do funkcji g�sto�ci rozk�adu jednostajnego
%Zwi�kszanie ilo�ci pr�bek powoduje, �e histogram zbli�a si� ksza�tem
%do funkcji g�sto�ci rozk�adu jednostajnego, co oznacza, �e
%szansa na wylosowanie danej liczny z przedzia�u (0,z) jest taka sama jak
%ka�dej innej z tego przedzia�u.


