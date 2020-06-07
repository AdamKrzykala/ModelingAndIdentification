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

estymAs = (X'*X)^(-1)*X'*Ys;
estymAn = (X'*X)^(-1)*X'*Yn;
estymVectors = zeros(D,1);
estymVectorn = zeros(D,1);
for i=1:D
    for j=1:N
        estymVectors(i) = estymVectors(i) +  estymAs(i,j);
        estymVectorn(i) = estymVectorn(i) +  estymAn(i,j);
    end
    estymVectors(i) = estymVectors(i) / N;
    estymVectorn(i) = estymVectorn(i) / N;
end
norm(estymVectors - a',2)
norm(estymVectorn - a',2)
