function [Ex,s,S] = estym_cauchy(mu, sigma, N)

pd = makedist('tLocationScale','mu',mu,'sigma',sigma,'nu',1);
rng('default');  % For reproducibility
T = random(pd,N,1);
%Estymator wartości oczekiwanej 
Ex = 0;
for i = 1:N
    Ex = Ex + T(i);
end
Ex= Ex/N;

%Obciążony estymator wariancji
BiasVar = 0;
for i = 1:N
    BiasVar = BiasVar + (T(i) - mu)^2;
end
s = BiasVar/N;

%Nieobciążony estymator wariancji
UnBiasVar = 0;
for i = 1:N
    UnBiasVar = UnBiasVar + (T(i) - mu)^2;
end
S = UnBiasVar/(N-1);

end

