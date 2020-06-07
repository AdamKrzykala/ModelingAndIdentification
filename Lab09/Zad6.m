%Macierz kowariancji estymatora

clear all;
close all;
D = 20;
mu = 0;
sigma = 1;
mu = ones(1,D)*mu;
N = 1000;

sigma = eye(D)*sigma;
rng('default')  % For reproducibility
X = mvnrnd(mu,sigma,N);
a = [1,4,7,3,2,6,1,9,3,2,1,5,4,7,4,3,9,0,1,2];

e = normrnd(0,1,[N,1]);
Zn = zeros(N,N);
Zs = zeros(N,N);
Yn = zeros(N,N);
Ys = zeros(N,N);
for i=1:N
   e_new = normrnd(0,1,[N,1]);
   Zn(:,i) = e_new;
   Zs(:,i) = e_new + 0.5*e;
   temp = X * a';
   for j=1:N
       Yn(j,i) =  temp(j) + Zn(j,i);
   end
   for j=1:N
       Ys(j,i) =  temp(j) + Zs(j,i);
   end
   e = e_new;
end
R = cov(Zs);
covEstym1 = 1 * (X'*X)^(-1); %Brak korelacji
covEstym2 = (X'*X)^(-1)*X'*R*X*(X'*X)^(-1);
bar3(covEstym2)