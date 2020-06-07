clear all;
close all;

thetaXi = [2.2641 0.4105];
N = 1000000;
%Wyznaczenie macierzy Psi
UN = unifrnd(0,1,[N,1]);
Psi = zeros(N,2);
Psi(:,1) = UN;

for i=2:(N)
   Psi(i,2) = Psi(i-1,:)*thetaXi';
end
%------------------------
theta = [2 0.5];
%Wyznaczenie macierzy Phi
Phi = zeros(N,2);
Phi(:,1) = UN;
e = unifrnd(-1,1);
Zn = zeros(N,1);
for i=1:length(Zn)
    new_e = unifrnd(-1,1);
    Zn(i) = new_e - theta(2)*e; 
    e = new_e;
end

for i=2:(N)
   Phi(i,2) = Phi(i-1,:)*theta' + Zn(i-1);
end
%-------------------------
Y = Phi*theta' + Zn;
%Estymator
inv(Psi'*Phi)*Psi'*Y
